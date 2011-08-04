This fork of Liquibase has been Maven'ized and oriented towards being a Kuali version of Liquibase

The pom's have been altered:
- Top level pom inherits from the Kuali pom
- groupId's changed to org.kuali.*
- Stripped out quite a bit of configuration that was redundant or otherwise not needed
- Changed the <scm> section to reflect the location of the source on GitHub
- All of the java based artifacts get deployed, including the example code

Source has been cleaned up by:
- Applying uniform code formatting (a slightly modified version of the default Sun formatting conventions)
- Organizing / sorting import statements
- Removing .* import statements
- A few other whitespace/formatting touch ups as pointed out by checkstyle

The built in Maven lifecyles (clean, site, and default) work

The Maven Release plugin works
