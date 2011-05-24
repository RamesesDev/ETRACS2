/*
 * CollectionSummaryPage.java
 *
 * Created on May 17, 2011, 10:06 AM
 */

package etracs2.tc.deposit;

import java.math.BigDecimal;

/**
 *
 * @author  jzamora
 */
public class DepositPage extends javax.swing.JPanel {
    
    /** Creates new form CollectionSummaryPage */
    public DepositPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        jPanel1 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel2 = new javax.swing.JPanel();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        jPanel3 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        xDataTable2 = new com.rameses.rcp.control.XDataTable();
        xActionBar2 = new com.rameses.rcp.control.XActionBar();
        jPanel5 = new javax.swing.JPanel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        jPanel6 = new javax.swing.JPanel();
        xSubFormPanel1 = new com.rameses.rcp.control.XSubFormPanel();
        jPanel8 = new javax.swing.JPanel();
        xDataTable3 = new com.rameses.rcp.control.XDataTable();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(704, 444));
        xActionBar1.setBorder(new com.rameses.rcp.control.border.XUnderlineBorder());
        xActionBar1.setName("mainActions");
        add(xActionBar1, java.awt.BorderLayout.NORTH);

        formPanel1.setPadding(new java.awt.Insets(5, 5, 1, 1));
        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel1.setCaption("Deposited By");
        xLabel1.setCaptionWidth(85);
        xLabel1.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel1.setName("entity.depositedbyname");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel1);

        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setCaption("Date Deposited");
        xLabel2.setCaptionWidth(85);
        xLabel2.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel2.setName("entity.txndate");
        xLabel2.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel2);

        xDataTable1.setHandler("summaryHandler");
        xDataTable1.setName("selectedSummary");

        jPanel4.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("List of Checks and Other Payments");
        jPanel4.setBorder(xTitledBorder1);
        xDataTable2.setDepends(new String[] {"selectedSummary"});
        xDataTable2.setDynamic(true);
        xDataTable2.setHandler("noncashHandler");
        xDataTable2.setImmediate(true);
        jPanel4.add(xDataTable2, java.awt.BorderLayout.CENTER);

        xActionBar2.setDepends(new String[] {"selectedSummary"});
        xActionBar2.setName("noncashActions");
        jPanel4.add(xActionBar2, java.awt.BorderLayout.NORTH);

        jPanel5.setLayout(new java.awt.BorderLayout());

        formPanel2.setCaptionBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 1));
        formPanel2.setPadding(new java.awt.Insets(1, 1, 5, 1));
        xLabel4.setForeground(new java.awt.Color(153, 0, 0));
        xLabel4.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel4.setCaption("Total");
        xLabel4.setCaptionWidth(50);
        xLabel4.setDepends(new String[] {"selectedSummary"});
        xLabel4.setFont(new java.awt.Font("Arial", 1, 12));
        xLabel4.setName("totalNonCashPayment");
        xLabel4.setPreferredSize(new java.awt.Dimension(120, 16));
        formPanel2.add(xLabel4);

        jPanel5.add(formPanel2, java.awt.BorderLayout.EAST);

        jPanel4.add(jPanel5, java.awt.BorderLayout.SOUTH);

        jPanel6.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Cash Breakdown");
        jPanel6.setBorder(xTitledBorder2);
        xSubFormPanel1.setDepends(new String[] {"selectedSummary"});
        xSubFormPanel1.setDynamic(true);
        xSubFormPanel1.setHandler("denominationOpener");
        jPanel6.add(xSubFormPanel1, java.awt.BorderLayout.CENTER);

        org.jdesktop.layout.GroupLayout jPanel3Layout = new org.jdesktop.layout.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel3Layout.createSequentialGroup()
                .add(jPanel4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 393, Short.MAX_VALUE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel6, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 342, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 244, Short.MAX_VALUE)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel6, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 244, Short.MAX_VALUE)
        );

        org.jdesktop.layout.GroupLayout jPanel2Layout = new org.jdesktop.layout.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 741, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jPanel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(xDataTable1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 130, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        jTabbedPane1.addTab("Deposit Summary", null, jPanel2, "Summary of Deposits");

        xDataTable3.setHandler("liquidationHandler");

        org.jdesktop.layout.GroupLayout jPanel8Layout = new org.jdesktop.layout.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .add(xDataTable3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 488, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(263, Short.MAX_VALUE))
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .add(xDataTable3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 380, Short.MAX_VALUE)
                .addContainerGap())
        );
        jTabbedPane1.addTab("Liquidations", null, jPanel8, "Liquidations included in this deposit");

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jTabbedPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 766, Short.MAX_VALUE)
                    .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 393, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 57, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jTabbedPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 430, Short.MAX_VALUE)
                .addContainerGap())
        );
        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JTabbedPane jTabbedPane1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XActionBar xActionBar2;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XDataTable xDataTable2;
    private com.rameses.rcp.control.XDataTable xDataTable3;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XSubFormPanel xSubFormPanel1;
    // End of variables declaration//GEN-END:variables
    
}
