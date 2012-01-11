Liquibase
-------
This fork of Liquibase is oriented towards requirements [The Kuali Foundation](http://www.kuali.org) has for database migration tooling.
This version is also a "superset" of the functionality from the original Liquibase source.  That is to say, as of today (01/12/2011) this version contains every commit from the parent GitHub repository in addition to the functionality that has been layered on top. 

Requirements
-------
One requirement for Kuali is that applications need to be database agnostic.  Towards this end, Kuali applications adhere to a subset of database functionality that is present across Oracle, MySQL, and embedded databases (H2, Derby, etc).  

[This page](https://wiki.kuali.org/display/KULRICE/Liquibase) documents the desired workflow for Kuali database tooling along with features/extensions/modifications that have gone in.


Maven Mod's
-------
Altered POM's:
- Top level pom inherits from the Kuali pom
- groupId's changed to org.kuali.*
- Stripped out quite a bit of configuration that was redundant or otherwise not needed
- Changed the &lt;scm&gt; section to reflect the location of the source on GitHub
- All of the java based artifacts get deployed, including the example code

The built in Maven lifecyles (clean, site, and default) work

The Maven Release plugin works

General Mod's
-------
Source has been cleaned up by:
- Applying uniform code formatting
- Organizing / sorting import statements
- Removing .* import statements
- A few other whitespace/formatting touch ups

