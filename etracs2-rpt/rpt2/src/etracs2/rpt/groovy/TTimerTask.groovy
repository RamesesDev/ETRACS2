
package etracs2.rpt.groovy

        
class TTimerTask extends com.rameses.rcp.common.Task {
    def ended = false
    def cancelled = false 
    
    def sleeptime = 500 
    
    def ontimer //handler
    
    public boolean accept() {
       return !ended && !cancelled 
    }
    
    public boolean isEnded() {
        return ended || cancelled 
    }

    public void execute() {
        while( cancelled == false || ended == false ) {
            try {
                println 'ontimer fired...'
                if (ontimer) ontimer() 
                Thread.sleep( sleeptime )
            }
            catch( e ) {
                //
            }
        }
        ended = true 
    }
}    
    