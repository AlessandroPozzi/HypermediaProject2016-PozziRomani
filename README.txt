Repository containing the project for the course Hypermedia Applications and Multimedia, 2016, PoliMI.

Authors: Alessandro Pozzi 852358, Marco Romani 852361.

Hosting site used: altervista.org .
Framerworks used: jQuery, Bootstrap.
No specific template has been used.
The database has been set with the storage engine InnoDB.

Notes about the final product:

- we implemented also the pages for THE GROUP topic, even if not mandatory.
- we did not implement the NEWS topic but, in order to stick to our design work, we put its landmark in all pages.
- links to NEWS are the only dead links in the whole prototype.
- for time reasons, we did not fill the database with lots of content, but we put at least one element in each category
  and at least two or three instances of each relation (sometimes more).
- due to the previous point, it could be useful to use the category "all Xs" in order to see the GT pattern properly
  in action.


- we decided to avoid using ajax for every type of content loaded from the server, in particular:
    - we noticed that sometimes, by design, the transition between two pages involves the replacing of nearly the whole page; 
      in those cases we thought that a normal synchronous request would have been more natural, also because we checked both
      by hand and on internet that loading an entire page asynchronously is considered bad practice.
    - we used ajax mainly to implement the GT and A2A patterns, because they involve transitions between very similar
      pages where asynchronous updates can perform a good and smooth job.
