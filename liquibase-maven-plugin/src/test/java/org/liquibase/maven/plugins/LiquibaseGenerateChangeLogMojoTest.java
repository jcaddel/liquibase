package org.liquibase.maven.plugins;

import junit.framework.Assert;

import org.apache.maven.project.MavenProject;
import org.codehaus.plexus.configuration.PlexusConfiguration;
import org.junit.Test;

public class LiquibaseGenerateChangeLogMojoTest extends AbstractLiquibaseMojoTest {

    private static final String CONFIG_FILE = "generateChangeLog/pom-export.xml";

    @Test
    public void testGenerateChangeLogMojo() throws Exception {
        LiquibaseGenerateChangeLogMojo mojo = createGenerateChangeLogMojo(CONFIG_FILE);
        Assert.assertEquals("Jim Smith", mojo.getAuthor());
        MavenProject project = mojo.getProject();
        System.out.println(project);
    }

    protected LiquibaseGenerateChangeLogMojo createGenerateChangeLogMojo(String configFileName) throws Exception {
        LiquibaseGenerateChangeLogMojo mojo = new LiquibaseGenerateChangeLogMojo();
        PlexusConfiguration config = loadConfiguration(configFileName);
        configureMojo(mojo, config);
        return mojo;
    }

}
