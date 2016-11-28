---
title: "Simplifying complex business logic with Python's Kanren"
metaAlignment: center
coverMeta: out
date: 2016-11-27
draft: false
categories:
- coding
tags:
- python
- tutorials
---

So-called "logic programming" has been a niche programming topic since Prolog
was introduced in the 80s. In my experience, most posts that cover logic
programming introduce the core concepts and stop there. The examples they
give are mostly toy problems. This post, then, will start with "what you can do
with logic programming in Python" and move toward the core concepts that way.

If you're looking for an explanation of **unification** or a history of logic
programming, and why you should even write web-servers this way, there are
plenty of posts that will extoll the virtues of logic programming over other
methods. This is not that post. I'm aware of these things, but my goal in this
post is to help you take the part of your code that is *least* maintainable as
written in a traditional Python style and make it cleaner, clearer, and less
prone to bugs using logic programming via the
[Kanren](https://github.com/logpy/logpy) library.

## Not what it _is_, but what is it _for_?

[Kanren](https://github.com/logpy/logpy) provides you a way to simplify the way
you specify and make your code respond to "business logic." Business logic is an
ill defined term, but in my experience it consists of all those if-then-else
statements, nested cases, and rats' warrens of callbacks that evolve over time
in complex applications that focus either on complex data processing, or on
responding to users who are themselves experts at something.

Kanren lets you express this logic in terms of rules and facts. I use Kanren to
do things like consistency checks in entered data, validity checks for records
that are POSTed to my APIs, and to perform complex filtering on users and
records that don't translate well into database queries.

Before we get started, you might want to do a quick:

~~~bash
$ pip install kanren
~~~

## For if not then-else, what?

Although I will work to something more substantial, let's start with a Hello
World. I start here because logic-programming is different enough to the way
most programmers think that a tiny, self-contained example will illustrate
some basic points.

~~~python
>>> from kanren import run, eq, var
>>> x = var()
>>> run(1, x, eq(x, 5))
(5,)
~~~

We'll skip the import and focus on the next statement. `x = var()` declares a
variable, which `run` will try to find one or more values for. `run` is a
function that takes the following:

* The number of results you want.
* The variables whose values you are interested in.
* The set of rules that defines the space of valid values for your variables.

The third bit is the most important, because it gives us a clue as to what
`eq(x, 5)` means. It does *not* mean "assign 5 to x". Instead it *constrains*
the result set so that it only includes results where `x` is equal to 5. What's
the difference?

It will take a more complex example to truly show the difference, but for now
suffice to say that `eq(x, 5)` works much more like the condition part of an
`if` statement than a statement inside the if:

~~~python
for x, y, z in all_possibilities:
  if other_logic:
    # ...
    if x == 5:
      yield (x,)
~~~

In reality, Kanren is a highly efficient, optimizing evaluator of logical
expressions. There is (usually) no loop, but for illustration purposes, this is
what our example "means". You can already see that we've taken a hairball of
potentially nested `ifs` and `fors` to a flat, sequential code structure in our
example.

### A (slightly) more illustrative example

~~~python
>>> set_a = {1, 2, 3}
>>> set_b = {2, 3, 4}
>>> run(2, x, (membero, x, set_a),  # x is a member of (1, 2, 3)
              (membero, x, set_b))  # x is a member of (2, 3, 4)
(2, 3)
>>> run(1, x, (membero, x, set_a),  # x is a member of (1, 2, 3)
              (membero, x, set_b))  # x is a member of (2, 3, 4)
(2,)
~~~

This example, taken from the Kanren `README` is a little more illustrative. It
uses a new (to us) primitive, `membero` to require that `x` be a member of a
set. Note that the structure we're checking membership of only has to be
iterable. It does not have to be a literal python set. Kanren operates on
primitive python types and their analogues, so if it swims like a duck and
quacks like a duck, then it's a duck for Kanren purposes. There are no new data
structures to learn, conversions to make, or classes to unpack.

I also introduced a different way to write the predicate. Instead of
`membero(x, set_a)`, I wrote `(membero, x, set_a)`. Although possibly a bit less
readable at first, nested structures are more readable this way, and I find that
after using the library in my own projects for a year or two, I like this style
better than the other.

Now we see a new behavior of `run`. It takes any number of clauses at the end
of the parameter list, and provides the logical and of all of them.  For our
purposes, we want two values of `x` that satisfy all the predicates.

Satisfying the first predicate, `(membero, x, set_a)` are the values 1, 2, and 3,
since these are the members of `set_a`. Satisfying the second predicate are the
values 2, 3, and 4, the members of `set_b`. The only results shared between the
two are 2 and 3, so these are the results of our call to `run`.

In the first instance of run, we ask for two results. Each result is a single
value of x (as opposed to one set of members that match) and so we get a tuple
consisting of both matching numbers. If we ask for only one result, we get just
one number. This is important, because as I said earlier, Kanren works on so-
called duck typing (walks, swims, quacks, therefore serves the purposes of a
duck even if you happen to call it a swan). This means results can be a tuple of
numbers, dicts, tuples, lists, or custom types -- anything that can be compared
in the way the predicates do comparisons. This makes Kanren very pythonic and
very useful.

## Making it more relatable

This is all fine, but it's hardly something that by itself will make our logic
more readable. For that, we need to talk about relations and facts. Here is
an example adapted from the Kanren README:

~~~python
>>> from kanren import Relation, facts
>>> parent = Relation()
>>> facts(parent, ("Homer", "Bart"),
...               ("Marge", "Bart"),
...               ("Homer", "Lisa"),
...               ("Marge", "Lisa"),
...               ("Homer", "Maggie"),
...               ("Marge", "Maggie"),
...               ("Abe",  "Homer"))
~~~

Now let's get one of the parents of Bart:

~~~python
>>> run(1, x, (parent, x, "Bart"))
('Marge',)
~~~

Two of Homer's children:

~~~python
>>> run(2, x, parent("Homer", x))
('Bart', 'Lisa')
~~~

Note that there's no order. The answer could have easily been "Homer" to the
first one or Lisa and Maggie to the second statement.

Now, to show that relations are more than just fancy ways to construct tuples,
let's figure out grandparents. We use an intermediate variable, `y` to represent
the parent of Bart. Then `x` is then the parent of the parent of bart.

~~~python
>>> y = var()
>>> run(1, x, parent(x, y),
              parent(y, 'Bart'))
('Abe',)

>>> run(1, (x, y), parent(x, y),
                   parent(y, 'Bart'))
(('Abe', 'Homer'),)
~~~

This shows off Kanren's advanced form of pattern matching known as "unification."
Unification and backtracking are really not in the scope of this tutorial, but
you may find it helps to understand them in detail as you use Kanren in your own
programs. In that case, start with Kanren's README and work from there.  For now
it is enough to consider that this works and its implications for writing
cleaner Python code.

Note we can list more than one variable we are interested in the value of. This
will create a nested tuple of variable values in the same respective order as
they are listed in run.

How might we have written this reasonably (if naïvely) in non-Kanren Python?

~~~python
>>> parent_child = {
...   "Homer": ("Bart", "Lisa", "Maggie"),
...   "Marge": ("Bart", "Lisa", "Maggie"),
...   "Abe": ("Homer",)
... }

# getting homer's children is simple.
>>> parent_child['Homer'][0:2]
("Bart", "Lisa")

# figuring out Bart's parents looks completely different (or we have to store
# and maintain two dicts)
>>> barts_parents = []
>>> for parent in parent_child:
...   if 'Bart' in parent_child[parent]:
...     barts_parents.append(parent)

# grandparents is even uglier, and requires we first compute parents.
>>> barts_grandparents = []
>>> for parent in barts_parents:  ## we computed this in the previous loop.
...   for grandparent in parent_child:
...     if parent in parent_child[grandparent]:
...       barts_grandparents.append(grandparent)  
~~~

The difference in legibility between the Kanren example and its admittedly
naïve Python equivalent should be obvious. In the Kanren example, we describe
relationships and assume they're transitive. This not only serves to help us
work from either direction in the relationship with the same statement, it also
allows us to build these relationships up over time without having to maintain
multiple dictionaries or describe relationships in terms of iteration and if
statements.

For simple logic that will never grow, it may be that the above is acceptable,
but it does tend to create code that people put big comments around warning the
interns off touching it.

## Reusability is your friend
