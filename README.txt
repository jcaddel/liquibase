This fork of liquibase has been Maven'ized and oriented towards being a Kuali version of Liquibase

The pom's have been significantly altered:
- Top level pom inherits from the Kuali pom
- org.kuali.* groupId's
- Stripped out quite a bit of configuration that was redundant or otherwise not needed
- Changed the <scm> section to reflect the location of the source on GitHub
- All of the java based artifacts get deployed, including the example code

The functionality of the source code is unchanged, but the source has been modified as follows:

- code formatting applied (a slightly modified version of the default Sun formatting conventions)
- Import statements organized with .* imports replaced by explicit imports
- A few other whitespace/formatting touch ups pointed out by checkstyle


All three of the built in Maven lifecyles (clean, site, and default) work correctly.

Also, the maven-release-plugin is what is used to produce release artifacts.
