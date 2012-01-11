Liquibase
-------
This fork of Liquibase is oriented towards requirements [The Kuali Foundation](http://www.kuali.org) has for database migration tooling.

Requirements
-------
The main requirement for Kuali is that applications should be database agnostic.  Towards this end, Kuali applications adhere to a subset of database functionality that is present across Oracle, MySQL, and embedded databases (H2, Derby, etc).  

https://wiki.kuali.org/display/KULRICE/Liquibase

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

