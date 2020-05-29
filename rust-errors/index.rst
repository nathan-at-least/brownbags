.. rust error handling documentation master file, created by
   sphinx-quickstart on Fri May 29 22:11:49 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

rust error handling
===================

*Nathan Wilcox* • 2020-06-01

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

- high-level abstractions with "0 cost".
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

rust basics
-----------

A Taste of Syntax
~~~~~~~~~~~~~~~~~

.. code-block:: rust

   let names = vec!["alice", "bob", "carol"];

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


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
