Liquibase
-------

This fork of Liquibase has been Maven'ized and oriented towards requirements The Kuali Foundation has for database migration tooling.

Requirements
-------
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

