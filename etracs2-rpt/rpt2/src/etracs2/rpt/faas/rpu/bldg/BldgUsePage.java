/*
 * BldgUsePage.java
 *
 * Created on June 27, 2011, 3:48 PM
 */

package etracs2.rpt.faas.rpu.bldg;

/**
 *
 * @author  rameses
 */

public class BldgUsePage extends javax.swing.JPanel {
    
    /** Creates new form BldgUsePage */
    public BldgUsePage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel2 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        jPanel1 = new javax.swing.JPanel();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xNumberField9 = new com.rameses.rcp.control.XNumberField();
        xNumberField10 = new com.rameses.rcp.control.XNumberField();
        xLabel6 = new com.rameses.rcp.control.XLabel();
        jPanel3 = new javax.swing.JPanel();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();

        setLayout(new java.awt.BorderLayout());

        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel1.setCaption("Building Use");
        xLabel1.setName("bldgclasstitle");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel1);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Building Floors");
        jPanel1.setBorder(xTitledBorder1);
        xDataTable1.setDynamic(true);
        xDataTable1.setHandler("bldgFloorListHandler");
        xDataTable1.setImmediate(true);
        xDataTable1.setName("selectedBldgFloor");

        xNumberField9.setEditable(false);
        xNumberField9.setCaption("Total Area");
        xNumberField9.setCaptionWidth(150);
        xNumberField9.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField9.setName("entity.totalarea");
        xNumberField9.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel2.add(xNumberField9);

        xNumberField10.setEditable(false);
        xNumberField10.setCaption("Total Additional");
        xNumberField10.setCaptionWidth(150);
        xNumberField10.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField10.setName("entity.totaladditional");
        xNumberField10.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel2.add(xNumberField10);

        xLabel6.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel6.setForeground(new java.awt.Color(153, 0, 0));
        xLabel6.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel6.setName("errorMsg");

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 432, Short.MAX_VALUE)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 289, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
            .add(xLabel6, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 432, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(xDataTable1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 164, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xLabel6, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout jPanel2Layout = new org.jdesktop.layout.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 288, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        add(jPanel2, java.awt.BorderLayout.CENTER);

        jPanel3.setLayout(new java.awt.BorderLayout());

        jPanel3.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xActionBar1.setName("formActions");
        xActionBar1.setPadding(new java.awt.Insets(3, 0, 3, 0));
        xActionBar1.setUseToolBar(false);
        jPanel3.add(xActionBar1, java.awt.BorderLayout.EAST);

        add(jPanel3, java.awt.BorderLayout.SOUTH);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel6;
    private com.rameses.rcp.control.XNumberField xNumberField10;
    private com.rameses.rcp.control.XNumberField xNumberField9;
    // End of variables declaration//GEN-END:variables
    
}
