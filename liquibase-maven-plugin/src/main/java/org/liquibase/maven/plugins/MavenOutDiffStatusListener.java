package org.liquibase.maven.plugins;

import liquibase.diff.DiffStatusListener;

import org.apache.maven.plugin.logging.Log;

public class MavenOutDiffStatusListener implements DiffStatusListener {
    Log log;

    public MavenOutDiffStatusListener() {
        this(null);
    }

    public MavenOutDiffStatusListener(Log log) {
        super();
        this.log = log;
    }

    @Override
    public void statusUpdate(String message) {
        log.info(message);
    }

    public Log getLog() {
        return log;
    }

    public void setLog(Log log) {
        this.log = log;
    }

}
