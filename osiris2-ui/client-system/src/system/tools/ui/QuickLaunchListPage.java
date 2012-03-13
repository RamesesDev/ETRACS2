package system.tools.ui;
/*
 * QuickLaunchListPage.java
 *
 * Created on January 5, 2012, 3:11 PM
 * @author jaycverg
 */


public class QuickLaunchListPage extends javax.swing.JPanel {
    
    public QuickLaunchListPage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jSeparator1 = new javax.swing.JSeparator();
        xButton1 = new com.rameses.rcp.control.XButton();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();

        xButton1.setMnemonic('c');
        xButton1.setText("Close");
        xButton1.setName("_close");

        xDataTable1.setHandler("listHandler");

        xActionTextField1.setActionName("listHandler.load");
        xActionTextField1.setHint("Type your search keyword here");
        xActionTextField1.setName("searchtext");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                .addContainerGap(336, Short.MAX_VALUE)
                .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jSeparator1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 417, Short.MAX_VALUE)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(xActionTextField1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 393, Short.MAX_VALUE)
                .addContainerGap())
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 393, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .add(xActionTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 27, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 274, Short.MAX_VALUE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jSeparator1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JSeparator jSeparator1;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    // End of variables declaration//GEN-END:variables
    
}
