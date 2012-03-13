package user.ui;

/*
 * OrgPage.java
 *
 * Created on September 7, 2010, 11:12 AM
 * @author jaycverg
 */
public class UserRolesPage extends javax.swing.JPanel {
    
    public UserRolesPage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel1 = new javax.swing.JPanel();
        xActionBar2 = new com.rameses.rcp.control.XActionBar();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xTable1 = new com.rameses.rcp.control.XTable();

        setLayout(new java.awt.BorderLayout());

        xActionBar2.setDepends(new String[] {"role"});
        xActionBar2.setDynamic(true);
        xActionBar2.setName("formActions");

        xLabel1.setExpression("#{formTitle}");
        xLabel1.setFont(new java.awt.Font("Arial", 1, 14));

        xTable1.setHandler("listHandler");
        xTable1.setName("role");

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(xLabel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 659, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, xActionBar2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 659, Short.MAX_VALUE)
                    .add(xTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 659, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(11, 11, 11)
                .add(xActionBar2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 400, Short.MAX_VALUE)
                .addContainerGap())
        );
        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar2;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XTable xTable1;
    // End of variables declaration//GEN-END:variables
    
}
