/*
 * FAASList.java
 *
 * Created on November 3, 2010, 4:35 PM
 */

package etracs2.prov;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamss
 */
@StyleSheet("etracs2/prov/ProvincePage.style")
public class ProvincePage extends javax.swing.JPanel {
    
    /** Creates new form FAASList */
    public ProvincePage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel7 = new javax.swing.JPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        jPanel1 = new javax.swing.JPanel();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        jPanel2 = new javax.swing.JPanel();
        xTable1 = new com.rameses.rcp.control.XTable();
        xTable2 = new com.rameses.rcp.control.XTable();
        xLabel2 = new com.rameses.rcp.control.XLabel();

        setLayout(new java.awt.BorderLayout());

        jPanel7.setLayout(new java.awt.BorderLayout());

        xLabel1.setBackground(new java.awt.Color(0, 51, 153));
        xLabel1.setBorder(javax.swing.BorderFactory.createEmptyBorder(3, 3, 3, 3));
        xLabel1.setForeground(new java.awt.Color(255, 255, 255));
        xLabel1.setFont(new java.awt.Font("Tahoma", 1, 18));
        xLabel1.setName("title");
        xLabel1.setOpaque(true);
        jPanel7.add(xLabel1, java.awt.BorderLayout.CENTER);

        add(jPanel7, java.awt.BorderLayout.NORTH);

        xActionBar1.setName("formActions");
        xActionBar1.setUseToolBar(false);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Province Information");
        formPanel1.setBorder(xTitledBorder1);
        xTextField1.setCaption("Index No.");
        xTextField1.setCaptionWidth(90);
        xTextField1.setIndex(-1);
        xTextField1.setInputFormat("\\d{3}");
        xTextField1.setInputFormatErrorMsg("Index No. should be numeric and 3 characters long");
        xTextField1.setMaxLength(3);
        xTextField1.setName("province.indexNo");
        xTextField1.setPreferredSize(new java.awt.Dimension(80, 19));
        xTextField1.setRequired(true);
        formPanel1.add(xTextField1);

        xTextField2.setCaption("Name ");
        xTextField2.setCaptionWidth(90);
        xTextField2.setName("province.name");
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField2.setRequired(true);
        formPanel1.add(xTextField2);

        xTextField3.setCaption("Formal Name");
        xTextField3.setCaptionWidth(90);
        xTextField3.setName("province.formalName");
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField3.setRequired(true);
        formPanel1.add(xTextField3);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("List of Municipalities");
        xTable1.setBorder(xTitledBorder2);
        xTable1.setDynamic(true);
        xTable1.setHandler("municipalityHandler");
        xTable1.setName("selectedMunicipality");
        xTable1.setShowRowHeader(true);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder3 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder3.setTitle("List of Barangays");
        xTable2.setBorder(xTitledBorder3);
        xTable2.setDepends(new String[] {"selectedMunicipality"});
        xTable2.setDynamic(true);
        xTable2.setHandler("barangayHandler");
        xTable2.setName("selectedBarangay");
        xTable2.setShowRowHeader(true);

        xLabel2.setForeground(new java.awt.Color(204, 0, 0));
        xLabel2.setDepends(new String[] {"selectedMunicipality", "selectedBarangay"});
        xLabel2.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel2.setName("message");

        org.jdesktop.layout.GroupLayout jPanel2Layout = new org.jdesktop.layout.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jPanel2Layout.createSequentialGroup()
                        .add(xTable1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 387, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(xTable2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 397, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(xLabel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 790, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel2Layout.createSequentialGroup()
                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(xTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 390, Short.MAX_VALUE)
                    .add(xTable2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 390, Short.MAX_VALUE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xLabel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, xActionBar1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 800, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 789, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(63, 63, 63))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 105, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(42, Short.MAX_VALUE))
        );
        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel7;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XTable xTable1;
    private com.rameses.rcp.control.XTable xTable2;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    // End of variables declaration//GEN-END:variables
    
}
