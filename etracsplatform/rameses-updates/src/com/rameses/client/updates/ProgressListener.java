package com.rameses.client.updates;


public interface ProgressListener {
    void start(String msg, int maxLength );
    void read();
    void end(String msg);
}
