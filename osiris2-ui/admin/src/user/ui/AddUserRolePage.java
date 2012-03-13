package user.ui;

/*
 * OrgPage.java
 *
 * Created on September 7, 2010, 11:12 AM
 * @author jaycverg
 */
public class AddUserRolePage extends javax.swing.JPanel {
    
    public AddUserRolePage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        xList1 = new com.rameses.rcp.control.XList();
        xButton1 = new com.rameses.rcp.control.XButton();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        jLabel1 = new javax.swing.JLabel();

        setLayout(new java.awt.BorderLayout());

        jLabel2.setText("Select a role below and click next");

        xList1.setDepends(new String[] {"groupType"});
        xList1.setDynamic(true);
        xList1.setExpression("#{name}");
        xList1.setItems("roleList");
        xList1.setName("role");
        jScrollPane1.setViewportView(xList1);

        xButton1.setText("Next");
        xButton1.setName("next");

        xLabel1.setFont(new java.awt.Font("Arial", 1, 14));
        xLabel1.setName("formTitle");

        xComboBox1.setAllowNull(false);
        xComboBox1.setImmediate(true);
        xComboBox1.setItems("groupTypes");
        xComboBox1.setName("groupType");

        jLabel1.setText("Select Group Type");

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(19, 19, 19)
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(xLabel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 467, Short.MAX_VALUE)
                    .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 78, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jLabel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 287, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false)
                        .add(jPanel1Layout.createSequentialGroup()
                            .add(jLabel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                            .add(xComboBox1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 177, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                        .add(org.jdesktop.layout.GroupLayout.LEADING, jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 276, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(xLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 24, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jLabel2)
                .add(15, 15, 15)
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(xComboBox1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jLabel1))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 204, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(14, 14, 14)
                .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(154, Short.MAX_VALUE))
        );
        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XList xList1;
    // End of variables declaration//GEN-END:variables
    
}
