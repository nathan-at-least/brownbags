.. rust error handling documentation master file, created by
   sphinx-quickstart on Fri May 29 22:11:49 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

rust error handling
===================

*Nathan Wilcox* • 2020-06-15

**Electric Coin Company**

.. image:: by-sa.png
   :scale: 20%

.. toctree::
   :maxdepth: 2
   :caption: Contents:

what is rust
------------

Hello World
~~~~~~~~~~~

.. code-block:: rust

   fn main() {
      println!("Hello World!");
   }

Language Goals
~~~~~~~~~~~~~~

- high-level abstractions with "0 runtime cost".
- expressive static type system.
- strong memory safety.
- can do low-level / systems / performant applications.
- friendly community, great toolchain, + the rustacean!

.. image:: rustacean-flat-happy.png
   :scale: 30%
   :align: right

Useful Setup
~~~~~~~~~~~~

#. Install with `rustup.rs`_
#. Run ``rustup doc --book`` to get the book in your browser (local, offline).
#. Run ``rustup doc --std`` to get the ``std`` API docs, local & offline.
#. Start your project: ``cargo new --bin myproj``
#. In your project directory, run ``cargo doc --open`` to get local/offline library docs.

.. _`rustup.rs`: https://rustup.rs

rust crash course
-----------------

What We Cover
~~~~~~~~~~~~~

- basic syntax
- static typing with inference
- concrete and abstract types
- user defined types: structs and enums
- methods and associated functions
- matching enums
- defining `Option` and `Result`

What We Exclude
~~~~~~~~~~~~~~~

- memory management
- traits
- probably a bunch of other stuff

IMO, abstract types, memory management, and traits are likely to be the three big learning curves for Javascript / Python -like background.

A Taste of Syntax
~~~~~~~~~~~~~~~~~

.. code-block:: rust

   let names = ["alice", "bob", "carol"];

   for name in names.iter() {
      println!("Hello, {}", name);
   }

Expression-Oriented Syntax
~~~~~~~~~~~~~~~~~~~~~~~~~~

A newcomer from javascript might do this:

.. code-block:: rust

   let mut x;  // This is similar to "var x" in JS.

   if use_an_odd {
      x = 3;
   } else {
      x = 8;
   }

Rust style would be expression oriented:

.. code-block:: rust

   let x = if use_an_odd { 3 } else { 8 };

Static Types and Inference
~~~~~~~~~~~~~~~~~~~~~~~~~~

Every variable binding in rust has a known unambiguous type:

.. code-block:: rust

   let x: bool = false;

The compiler uses `type inference` so that you frequently can omit types:

.. code-block:: rust

   let x = false;

Top-level functions must always be written with explicit types:

.. code-block:: rust

   fn add_unsigned_32bits(a: u32, b: u32) -> u32 { a + b }


Concrete vs Abstract Types
~~~~~~~~~~~~~~~~~~~~~~~~~~

Some types are `concrete`, some `abstract`.

Every binding must have a known unambiguous `concrete type`.

Examples:

- ``i32`` (signed 32bit int)
- ``String``
- ``File``
- ``bool``

Abstract Types
~~~~~~~~~~~~~~

These represent common interfaces to related concrete types.

Examples:

- ``Vec`` - a sequence of items in contiguous memory
- ``Fn`` - a kind of function
- ``Option`` - allows for "value not present" logic
- ``Result`` - our star for this presentation series

Instantiating Abstract Types
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By supplying `type parameters` which meet some `constraints`, abstract types are instantiated to concrete types:

- ``Vec<String>``
- ``Fn(u32, u32) -> u32``
- ``Option<File>``

User-defined Types - Structs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: rust

    struct Point {
      x: f64,
      y: f64,
    }

    struct Circle {
      center: Point,
      radius: f64,
    }

    struct Rectangle {
      topleft: Point,
      width: f64,
      height: f64,
    }
      
User-defined Types - Methods
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: rust

    impl Point {
      // ...

      fn add_to(&self, other: &Point) -> Point {
        Point {
          x: self.x + other.x,
          y: self.y + other.y,
        }
      }
    }

Note: First time we've seen `&`. These slides gloss over memory management, a big essential topic!

User-defined Types - Associated Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: rust

    impl Point {
      fn new(x: f64, y: f64) -> Point {
        Point { x, y }
      }

      // ...
    }

Using our type:

.. code-block:: rust

    let p1 = Point::new(3, 4);
    let p2 = Point::new(1, 2);
    let p3 = p1.add_to(&p2);

    assert!(p3.x == 4 && p3.y == 6);

Some Basic Methods for Later
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: rust

    impl Circle {
      fn area(&self) -> f64 {
        use std::f64::consts::PI;

        PI * self.radius.powf(2)
      }
    }

    impl Rectangle {
      fn area(&self) -> f64 {
        self.width * self.height
      }
    }

User-defined Types - Enums
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: rust

    enum Boolish {
      Yes,
      No,
    }

    enum Shape {
      Circle(Circle),
      Rectangle(Rectangle),
    }

    enum StyleElement {
      Font(String),
      RGB(u8, u8, u8),
    }

Enums and Matching
~~~~~~~~~~~~~~~~~~

.. code-block:: rust

    fn shape_area(shape: Shape) -> f64 {
      match shape {
        Shape::Circle(c) => c.area(),
        Shape::Rectangle(r) => r.area(),
      }
    }

Also works within methods:

.. code-block:: rust

    impl Shape {
      fn area(&self) -> f64 {
        match shape {
          Shape::Circle(c) => c.area(),
          Shape::Rectangle(r) => r.area(),
        }
      }
    }

User-defined Abstract Types
~~~~~~~~~~~~~~~~~~~~~~~~~~~

A type is generic when defined with `type parameters`:

.. code-block:: rust

    struct Spheroid<P> {
      center: P,
      radius: f64,
    }

Now we can create a concrete `Spheroid` with our 2d `Point`:

.. code-block:: rust

    let circle = Spheroid {
      center: Point::new(2.0, 3.0),
      radius: 42.0,
    }

Here's how we write the type of `circle`:

.. code-block:: rust

    let circle: Spheroid<Point> = Spheroid {
      ...
    }

Two Fundamental Abstract Types
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: rust

    enum Option<T> {
      None,
      Some(T),
    }

    enum Result<T, E> {
      Ok(T),
      Err(E),
    }

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
