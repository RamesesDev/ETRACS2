/*
 * RPTBatchCollectionListPage.java
 *
 * Created on March 23, 2012, 10:23 AM
 */

package etracs2.rpt.collection.batch;

/**
 *
 * @author  jzamora
 */
public class RPTBatchCollectionListPage extends javax.swing.JPanel {
    
    /** Creates new form RPTBatchCollectionListPage */
    public RPTBatchCollectionListPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel1 = new javax.swing.JPanel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        jPanel6 = new javax.swing.JPanel();
        jPanel7 = new javax.swing.JPanel();
        formPanel3 = new com.rameses.rcp.util.FormPanel();
        formPanel4 = new com.rameses.rcp.util.FormPanel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        formPanel5 = new com.rameses.rcp.util.FormPanel();
        xLabel5 = new com.rameses.rcp.control.XLabel();
        xLabel6 = new com.rameses.rcp.control.XLabel();
        xLabel11 = new com.rameses.rcp.control.XLabel();
        xButton1 = new com.rameses.rcp.control.XButton();
        xButton2 = new com.rameses.rcp.control.XButton();
        xButton3 = new com.rameses.rcp.control.XButton();
        xButton4 = new com.rameses.rcp.control.XButton();
        jPanel8 = new javax.swing.JPanel();
        xLabel12 = new com.rameses.rcp.control.XLabel();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        xActionBar2 = new com.rameses.rcp.control.XActionBar();

        setLayout(new java.awt.BorderLayout());

        jPanel1.setLayout(new java.awt.BorderLayout());

        jPanel1.setPreferredSize(new java.awt.Dimension(347, 36));

        formPanel2.setCaptionFont(new java.awt.Font("Arial", 1, 14));
        formPanel2.setCaptionVAlignment(com.rameses.rcp.constant.UIConstants.CENTER);
        formPanel2.setCaptionWidth(120);
        formPanel2.setPreferredSize(new java.awt.Dimension(280, 28));
        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel1.setForeground(new java.awt.Color(153, 0, 0));
        xLabel1.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel1.setCaption("Amount Due");
        xLabel1.setCaptionWidth(110);
        xLabel1.setFont(new java.awt.Font("Arial", 1, 14));
        xLabel1.setName("amtdue");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 26));
        formPanel2.add(xLabel1);

        jPanel1.add(formPanel2, java.awt.BorderLayout.EAST);

        add(jPanel1, java.awt.BorderLayout.SOUTH);

        jPanel6.setLayout(new java.awt.BorderLayout());

        jPanel7.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 3, 0, 3));
        jPanel7.setPreferredSize(new java.awt.Dimension(100, 120));

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Property Information");
        formPanel3.setBorder(xTitledBorder1);
        formPanel3.setPreferredSize(new java.awt.Dimension(1524, 90));

        formPanel4.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel4.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel4.setShowCaption(false);
        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setCaption("TD No.");
        xLabel2.setCaptionWidth(60);
        xLabel2.setCellPadding(new java.awt.Insets(0, 0, 0, 10));
        xLabel2.setDepends(new String[] {"selectedItem"});
        xLabel2.setName("selectedItem.tdno");
        xLabel2.setPreferredSize(new java.awt.Dimension(180, 19));
        formPanel4.add(xLabel2);

        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel3.setCaption("PIN");
        xLabel3.setCaptionWidth(60);
        xLabel3.setCellPadding(new java.awt.Insets(0, 0, 0, 10));
        xLabel3.setDepends(new String[] {"selectedItem"});
        xLabel3.setName("selectedItem.pin");
        xLabel3.setPreferredSize(new java.awt.Dimension(180, 19));
        formPanel4.add(xLabel3);

        xLabel4.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel4.setCaption("Kind");
        xLabel4.setCaptionWidth(100);
        xLabel4.setDepends(new String[] {"selectedItem"});
        xLabel4.setName("selectedItem.rputype");
        xLabel4.setPreferredSize(new java.awt.Dimension(150, 19));
        formPanel4.add(xLabel4);

        formPanel3.add(formPanel4);

        formPanel5.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel5.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel5.setShowCaption(false);
        xLabel5.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel5.setCaption("Location");
        xLabel5.setCaptionWidth(60);
        xLabel5.setCellPadding(new java.awt.Insets(0, 0, 0, 10));
        xLabel5.setDepends(new String[] {"selectedItem"});
        xLabel5.setName("selectedItem.barangay");
        xLabel5.setPreferredSize(new java.awt.Dimension(180, 19));
        formPanel5.add(xLabel5);

        xLabel6.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel6.setCaption("Lot No.");
        xLabel6.setCaptionWidth(60);
        xLabel6.setCellPadding(new java.awt.Insets(0, 0, 0, 10));
        xLabel6.setDepends(new String[] {"selectedItem"});
        xLabel6.setName("selectedItem.cadastrallotno");
        xLabel6.setPreferredSize(new java.awt.Dimension(180, 19));
        formPanel5.add(xLabel6);

        xLabel11.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel11.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel11.setCaption("Assessed Value");
        xLabel11.setCaptionWidth(100);
        xLabel11.setDepends(new String[] {"selectedItem"});
        xLabel11.setName("assessedvalue");
        xLabel11.setPreferredSize(new java.awt.Dimension(150, 19));
        formPanel5.add(xLabel11);

        formPanel3.add(formPanel5);

        xButton1.setMnemonic('s');
        xButton1.setText("Select All");
        xButton1.setName("selectAll");

        xButton2.setMnemonic('d');
        xButton2.setText("Deselect All");
        xButton2.setName("deselectAll");

        xButton3.setMnemonic('f');
        xButton3.setText("Full Payment");
        xButton3.setName("fullPayment");

        xButton4.setMnemonic('p');
        xButton4.setText("Partial Payment");
        xButton4.setName("partialPayment");

        org.jdesktop.layout.GroupLayout jPanel7Layout = new org.jdesktop.layout.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel7Layout.createSequentialGroup()
                .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xButton3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xButton4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(335, Short.MAX_VALUE))
            .add(formPanel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 715, Short.MAX_VALUE)
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel7Layout.createSequentialGroup()
                .add(formPanel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 80, Short.MAX_VALUE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel7Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xButton3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xButton4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        jPanel6.add(jPanel7, java.awt.BorderLayout.SOUTH);

        jPanel8.setLayout(new java.awt.BorderLayout());

        xLabel12.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel12.setForeground(new java.awt.Color(153, 0, 0));
        xLabel12.setFont(new java.awt.Font("Arial", 1, 14));
        xLabel12.setName("errorMsg");
        jPanel8.add(xLabel12, java.awt.BorderLayout.SOUTH);

        xDataTable1.setHandler("listHandler");
        xDataTable1.setImmediate(true);
        xDataTable1.setIndex(-100);
        xDataTable1.setName("selectedItem");
        jPanel8.add(xDataTable1, java.awt.BorderLayout.CENTER);

        jPanel6.add(jPanel8, java.awt.BorderLayout.CENTER);

        add(jPanel6, java.awt.BorderLayout.CENTER);

        xActionBar2.setBorder(new com.rameses.rcp.control.border.XUnderlineBorder());
        xActionBar2.setName("listActions");
        xActionBar2.setPadding(new java.awt.Insets(0, 0, 5, 0));
        add(xActionBar2, java.awt.BorderLayout.NORTH);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel2;
    private com.rameses.rcp.util.FormPanel formPanel3;
    private com.rameses.rcp.util.FormPanel formPanel4;
    private com.rameses.rcp.util.FormPanel formPanel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private com.rameses.rcp.control.XActionBar xActionBar2;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XButton xButton2;
    private com.rameses.rcp.control.XButton xButton3;
    private com.rameses.rcp.control.XButton xButton4;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel11;
    private com.rameses.rcp.control.XLabel xLabel12;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel5;
    private com.rameses.rcp.control.XLabel xLabel6;
    // End of variables declaration//GEN-END:variables
    
}
