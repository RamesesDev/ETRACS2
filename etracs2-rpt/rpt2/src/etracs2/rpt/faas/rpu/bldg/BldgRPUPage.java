/*
 * LandRPUPage.java
 *
 * Created on June 25, 2011, 1:45 PM
 */

package etracs2.rpt.faas.rpu.bldg;

import com.rameses.rcp.ui.annotations.StyleSheet;


@StyleSheet("etracs2/rpt/faas/rpu/bldg/BldgRPUPage.style")
public class BldgRPUPage extends javax.swing.JPanel {
    
    /** Creates new form LandRPUPage */
    public BldgRPUPage() {
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
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        jPanel8 = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xCheckBox3 = new com.rameses.rcp.control.XCheckBox();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        formPanel3 = new com.rameses.rcp.util.FormPanel();
        xNumberField1 = new com.rameses.rcp.control.XNumberField();
        xNumberField2 = new com.rameses.rcp.control.XNumberField();
        xNumberField3 = new com.rameses.rcp.control.XNumberField();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel2 = new javax.swing.JPanel();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        formPanel4 = new com.rameses.rcp.util.FormPanel();
        formPanel12 = new com.rameses.rcp.util.FormPanel();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        formPanel13 = new com.rameses.rcp.util.FormPanel();
        xActionTextField3 = new com.rameses.rcp.control.XActionTextField();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xSeparator1 = new com.rameses.rcp.control.XSeparator();
        xNumberField4 = new com.rameses.rcp.control.XNumberField();
        xComboBox3 = new com.rameses.rcp.control.XComboBox();
        xSeparator2 = new com.rameses.rcp.control.XSeparator();
        xCheckBox1 = new com.rameses.rcp.control.XCheckBox();
        formPanel14 = new com.rameses.rcp.util.FormPanel();
        xNumberField5 = new com.rameses.rcp.control.XNumberField();
        xCheckBox2 = new com.rameses.rcp.control.XCheckBox();
        xSeparator3 = new com.rameses.rcp.control.XSeparator();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();
        jPanel6 = new javax.swing.JPanel();
        formPanel11 = new com.rameses.rcp.util.FormPanel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xSeparator4 = new com.rameses.rcp.control.XSeparator();
        xDateField2 = new com.rameses.rcp.control.XDateField();
        xDateField3 = new com.rameses.rcp.control.XDateField();
        xNumberField6 = new com.rameses.rcp.control.XNumberField();
        xNumberField7 = new com.rameses.rcp.control.XNumberField();
        xNumberField8 = new com.rameses.rcp.control.XNumberField();
        xNumberField10 = new com.rameses.rcp.control.XNumberField();
        xSeparator5 = new com.rameses.rcp.control.XSeparator();
        xNumberField9 = new com.rameses.rcp.control.XNumberField();
        jPanel4 = new javax.swing.JPanel();
        jPanel5 = new javax.swing.JPanel();
        xComboBox4 = new com.rameses.rcp.control.XComboBox();
        xDataTable2 = new com.rameses.rcp.control.XDataTable();
        jLabel2 = new javax.swing.JLabel();
        xLabel6 = new com.rameses.rcp.control.XLabel();
        xButton1 = new com.rameses.rcp.control.XButton();

        setLayout(new java.awt.BorderLayout());

        jPanel7.setLayout(new java.awt.BorderLayout());

        jPanel7.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xActionBar1.setName("formActions");
        xActionBar1.setPadding(new java.awt.Insets(2, 0, 2, 0));
        xActionBar1.setUseToolBar(false);
        jPanel7.add(xActionBar1, java.awt.BorderLayout.EAST);

        add(jPanel7, java.awt.BorderLayout.SOUTH);

        jPanel1.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("General Information");
        formPanel1.setBorder(xTitledBorder1);
        formPanel1.setPreferredSize(new java.awt.Dimension(200, 74));
        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel1.setCaption("Revision Year");
        xLabel1.setName("rpu.ry");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel1);

        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setCaption("PIN");
        xLabel2.setName("rpu.fullpin");
        xLabel2.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel2);

        jPanel1.add(formPanel1, java.awt.BorderLayout.CENTER);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Taxability");
        formPanel2.setBorder(xTitledBorder2);
        formPanel2.setPreferredSize(new java.awt.Dimension(220, 80));
        xCheckBox3.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox3.setText("Taxable? ");
        xCheckBox3.setCaption("Taxability");
        xCheckBox3.setCaptionWidth(90);
        xCheckBox3.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox3.setName("rpu.taxable");
        xCheckBox3.setRequestFocus(false);
        formPanel2.add(xCheckBox3);

        xComboBox2.setCaption("Exempt Reason");
        xComboBox2.setCaptionWidth(90);
        xComboBox2.setDepends(new String[] {"rpu.info.taxable"});
        xComboBox2.setExpression("#{exemptcode}");
        xComboBox2.setItems("exemptionList");
        xComboBox2.setName("exemption");
        xComboBox2.setPreferredSize(new java.awt.Dimension(0, 22));
        formPanel2.add(xComboBox2);

        jPanel1.add(formPanel2, java.awt.BorderLayout.EAST);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder3 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder3.setTitle("Assessment Summary");
        formPanel3.setBorder(xTitledBorder3);
        formPanel3.setCaptionBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 1));
        formPanel3.setCellpadding(new java.awt.Insets(0, 0, 0, 20));
        formPanel3.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        xNumberField1.setCaption("Base Market Value");
        xNumberField1.setCaptionWidth(110);
        xNumberField1.setCellPadding(new java.awt.Insets(0, 0, 0, 20));
        xNumberField1.setFont(new java.awt.Font("Arial", 1, 12));
        xNumberField1.setName("rpu.totalbmv");
        xNumberField1.setPreferredSize(new java.awt.Dimension(130, 19));
        xNumberField1.setReadonly(true);
        formPanel3.add(xNumberField1);

        xNumberField2.setCaption("Market Value");
        xNumberField2.setCellPadding(new java.awt.Insets(0, 0, 0, 20));
        xNumberField2.setFont(new java.awt.Font("Arial", 1, 12));
        xNumberField2.setName("rpu.totalmv");
        xNumberField2.setPreferredSize(new java.awt.Dimension(130, 19));
        xNumberField2.setReadonly(true);
        formPanel3.add(xNumberField2);

        xNumberField3.setCaption("Assessed Value");
        xNumberField3.setCaptionWidth(100);
        xNumberField3.setCellPadding(new java.awt.Insets(0, 0, 0, 20));
        xNumberField3.setFont(new java.awt.Font("Arial", 1, 12));
        xNumberField3.setName("rpu.totalav");
        xNumberField3.setPreferredSize(new java.awt.Dimension(120, 19));
        xNumberField3.setReadonly(true);
        formPanel3.add(xNumberField3);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder4 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder4.setTitle("Structure Information");
        xDataTable1.setBorder(xTitledBorder4);
        xDataTable1.setHandler("structureListHandler");
        xDataTable1.setImmediate(true);
        xDataTable1.setName("selectedStructure");
        xDataTable1.setShowRowHeader(true);

        formPanel4.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        formPanel4.setCaptionWidth(95);

        formPanel12.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel12.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel12.setShowCaption(false);
        xActionTextField1.setActionName("lookupBldgType");
        xActionTextField1.setCaption("Building Type");
        xActionTextField1.setCaptionWidth(120);
        xActionTextField1.setCellPadding(new java.awt.Insets(0, 10, 0, 0));
        xActionTextField1.setName("bldgtype");
        xActionTextField1.setPreferredSize(new java.awt.Dimension(80, 18));
        xActionTextField1.setRequired(true);
        formPanel12.add(xActionTextField1);

        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel3.setCaption("");
        xLabel3.setDepends(new String[] {"bldgtype"});
        xLabel3.setName("rpu.info.bldgtype.bldgtypename");
        xLabel3.setPreferredSize(new java.awt.Dimension(250, 18));
        xLabel3.setShowCaption(false);
        formPanel12.add(xLabel3);

        formPanel4.add(formPanel12);

        formPanel13.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel13.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel13.setShowCaption(false);
        xActionTextField3.setActionName("lookupBldgKind");
        xActionTextField3.setCaption("Kind of Building");
        xActionTextField3.setCaptionWidth(120);
        xActionTextField3.setCellPadding(new java.awt.Insets(0, 10, 0, 0));
        xActionTextField3.setName("bldgkind");
        xActionTextField3.setPreferredSize(new java.awt.Dimension(80, 18));
        xActionTextField3.setRequired(true);
        formPanel13.add(xActionTextField3);

        xLabel4.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel4.setCaption("");
        xLabel4.setDepends(new String[] {"bldgkind"});
        xLabel4.setName("rpu.info.bldgkindbucc.bldgkindname");
        xLabel4.setPreferredSize(new java.awt.Dimension(250, 18));
        xLabel4.setShowCaption(false);
        formPanel13.add(xLabel4);

        formPanel4.add(formPanel13);

        xSeparator1.setPreferredSize(new java.awt.Dimension(0, 10));
        org.jdesktop.layout.GroupLayout xSeparator1Layout = new org.jdesktop.layout.GroupLayout(xSeparator1);
        xSeparator1.setLayout(xSeparator1Layout);
        xSeparator1Layout.setHorizontalGroup(
            xSeparator1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 462, Short.MAX_VALUE)
        );
        xSeparator1Layout.setVerticalGroup(
            xSeparator1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 10, Short.MAX_VALUE)
        );
        formPanel4.add(xSeparator1);

        xNumberField4.setCaption("Base Value");
        xNumberField4.setCaptionWidth(120);
        xNumberField4.setCellPadding(new java.awt.Insets(0, 10, 0, 0));
        xNumberField4.setDepends(new String[] {"bldgtype", "bldgkind"});
        xNumberField4.setFieldType(java.math.BigDecimal.class);
        xNumberField4.setName("firstfloorbasevalue");
        xNumberField4.setPattern("#,##0.00");
        xNumberField4.setPreferredSize(new java.awt.Dimension(150, 19));
        xNumberField4.setRequired(true);
        formPanel4.add(xNumberField4);

        xComboBox3.setCaption("Building Class");
        xComboBox3.setCaptionWidth(120);
        xComboBox3.setCellPadding(new java.awt.Insets(0, 10, 0, 0));
        xComboBox3.setDynamic(true);
        xComboBox3.setEmptyText("- NA -");
        xComboBox3.setImmediate(true);
        xComboBox3.setItems("classList");
        xComboBox3.setName("rpu.info.bldgtypeclass");
        xComboBox3.setPreferredSize(new java.awt.Dimension(150, 19));
        formPanel4.add(xComboBox3);

        xSeparator2.setPadding(new java.awt.Insets(10, 0, 0, 0));
        xSeparator2.setPreferredSize(new java.awt.Dimension(0, 25));
        org.jdesktop.layout.GroupLayout xSeparator2Layout = new org.jdesktop.layout.GroupLayout(xSeparator2);
        xSeparator2.setLayout(xSeparator2Layout);
        xSeparator2Layout.setHorizontalGroup(
            xSeparator2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 462, Short.MAX_VALUE)
        );
        xSeparator2Layout.setVerticalGroup(
            xSeparator2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 25, Short.MAX_VALUE)
        );
        formPanel4.add(xSeparator2);

        xCheckBox1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox1.setText("Sworn Statement");
        xCheckBox1.setCaption("");
        xCheckBox1.setCellPadding(new java.awt.Insets(0, 10, 0, 0));
        xCheckBox1.setMargin(new java.awt.Insets(0, 0, 10, 0));
        xCheckBox1.setName("rpu.info.swornstatement");
        xCheckBox1.setShowCaption(false);
        xCheckBox1.setValue(0);
        formPanel4.add(xCheckBox1);

        formPanel14.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel14.setPadding(new java.awt.Insets(0, 0, 0, 10));
        formPanel14.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel14.setShowCaption(false);
        xNumberField5.setCaption("Sworn Amount");
        xNumberField5.setCaptionWidth(90);
        xNumberField5.setCellPadding(new java.awt.Insets(0, 40, 0, 20));
        xNumberField5.setDepends(new String[] {"rpu.info.swornstatement"});
        xNumberField5.setFieldType(java.math.BigDecimal.class);
        xNumberField5.setName("rpu.info.swornamount");
        xNumberField5.setPattern("#,##0.00");
        xNumberField5.setPreferredSize(new java.awt.Dimension(100, 18));
        formPanel14.add(xNumberField5);

        xCheckBox2.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox2.setText("Use Sworn Amount?");
        xCheckBox2.setCaption("");
        xCheckBox2.setDepends(new String[] {"rpu.info.swornstatement"});
        xCheckBox2.setName("useswornamount");
        xCheckBox2.setPreferredSize(new java.awt.Dimension(200, 19));
        xCheckBox2.setShowCaption(false);
        xCheckBox2.setValue(0);
        formPanel14.add(xCheckBox2);

        formPanel4.add(formPanel14);

        xSeparator3.setPadding(new java.awt.Insets(10, 0, 0, 0));
        xSeparator3.setPreferredSize(new java.awt.Dimension(0, 25));
        org.jdesktop.layout.GroupLayout xSeparator3Layout = new org.jdesktop.layout.GroupLayout(xSeparator3);
        xSeparator3.setLayout(xSeparator3Layout);
        xSeparator3Layout.setHorizontalGroup(
            xSeparator3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 462, Short.MAX_VALUE)
        );
        xSeparator3Layout.setVerticalGroup(
            xSeparator3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 25, Short.MAX_VALUE)
        );
        formPanel4.add(xSeparator3);

        jScrollPane1.setPreferredSize(new java.awt.Dimension(0, 50));
        xTextArea1.setColumns(20);
        xTextArea1.setRows(5);
        xTextArea1.setCaption("Additional Information");
        xTextArea1.setCaptionWidth(120);
        xTextArea1.setCellPadding(new java.awt.Insets(0, 10, 0, 0));
        xTextArea1.setName("rpu.info.additionalinfo");
        xTextArea1.setPreferredSize(new java.awt.Dimension(164, 30));
        jScrollPane1.setViewportView(xTextArea1);

        formPanel4.add(jScrollPane1);

        org.jdesktop.layout.GroupLayout jPanel2Layout = new org.jdesktop.layout.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 301, Short.MAX_VALUE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 476, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 290, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, formPanel4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 290, Short.MAX_VALUE))
                .addContainerGap())
        );
        jTabbedPane1.addTab("Building Characteristic", jPanel2);

        formPanel11.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        formPanel11.setCaptionWidth(100);
        xTextField1.setCaption("PSIC");
        xTextField1.setCaptionWidth(110);
        xTextField1.setName("rpu.info.psic");
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xTextField1);

        xTextField2.setCaption("Permit No");
        xTextField2.setCaptionWidth(110);
        xTextField2.setName("rpu.info.permitno");
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xTextField2);

        xDateField1.setCaption("Permit Date");
        xDateField1.setCaptionWidth(110);
        xDateField1.setDepends(new String[] {"rpu.info.permitno"});
        xDateField1.setName("rpu.info.permitdate");
        xDateField1.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xDateField1);

        xTextField3.setCaption("Issued By");
        xTextField3.setCaptionWidth(110);
        xTextField3.setName("rpu.info.issuedby");
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xTextField3);

        xSeparator4.setPreferredSize(new java.awt.Dimension(0, 15));
        org.jdesktop.layout.GroupLayout xSeparator4Layout = new org.jdesktop.layout.GroupLayout(xSeparator4);
        xSeparator4.setLayout(xSeparator4Layout);
        xSeparator4Layout.setHorizontalGroup(
            xSeparator4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 245, Short.MAX_VALUE)
        );
        xSeparator4Layout.setVerticalGroup(
            xSeparator4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 15, Short.MAX_VALUE)
        );
        formPanel11.add(xSeparator4);

        xDateField2.setCaption("Date Completed");
        xDateField2.setCaptionWidth(110);
        xDateField2.setName("dtcompleted");
        xDateField2.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xDateField2);

        xDateField3.setCaption("Date Occupied");
        xDateField3.setCaptionWidth(110);
        xDateField3.setName("dtoccupied");
        xDateField3.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xDateField3);

        xNumberField6.setCaption("Age");
        xNumberField6.setCaptionWidth(110);
        xNumberField6.setDepends(new String[] {"dtcompleted", "dtoccupied", "bldgtype", "bldgkind"});
        xNumberField6.setFieldType(int.class);
        xNumberField6.setName("bldgage");
        xNumberField6.setPattern("#,###");
        xNumberField6.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xNumberField6);

        xNumberField7.setCaption("Depreciation ( % )");
        xNumberField7.setCaptionWidth(110);
        xNumberField7.setDepends(new String[] {"bldgtype", "bldgkind", "dtcompleted", "dtoccupied"});
        xNumberField7.setFieldType(java.math.BigDecimal.class);
        xNumberField7.setName("depreciation");
        xNumberField7.setPattern("#,##0.00");
        xNumberField7.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xNumberField7);

        xNumberField8.setCaption("Depreciation Value");
        xNumberField8.setCaptionWidth(110);
        xNumberField8.setEnabled(false);
        xNumberField8.setFieldType(java.math.BigDecimal.class);
        xNumberField8.setName("rpu.info.depreciationvalue");
        xNumberField8.setPattern("#,##0.00");
        xNumberField8.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xNumberField8);

        xNumberField10.setCaption("Percent Completed");
        xNumberField10.setCaptionWidth(110);
        xNumberField10.setDepends(new String[] {"bldgtype", "bldgkind", "dtcompleted", "dtoccupied"});
        xNumberField10.setFieldType(java.math.BigDecimal.class);
        xNumberField10.setName("percentcompleted");
        xNumberField10.setPattern("#,##0.00");
        xNumberField10.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel11.add(xNumberField10);

        xSeparator5.setPreferredSize(new java.awt.Dimension(0, 15));
        org.jdesktop.layout.GroupLayout xSeparator5Layout = new org.jdesktop.layout.GroupLayout(xSeparator5);
        xSeparator5.setLayout(xSeparator5Layout);
        xSeparator5Layout.setHorizontalGroup(
            xSeparator5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 245, Short.MAX_VALUE)
        );
        xSeparator5Layout.setVerticalGroup(
            xSeparator5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 15, Short.MAX_VALUE)
        );
        formPanel11.add(xSeparator5);

        xNumberField9.setCaption("Floor Count");
        xNumberField9.setCaptionWidth(110);
        xNumberField9.setFieldType(Integer.class);
        xNumberField9.setName("rpu.info.floorcount");
        xNumberField9.setPreferredSize(new java.awt.Dimension(0, 19));
        xNumberField9.setRequired(true);
        formPanel11.add(xNumberField9);

        jPanel4.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder5 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder5.setTitle("Building Classification");
        jPanel4.setBorder(xTitledBorder5);
        xComboBox4.setCaption("Classification");
        xComboBox4.setExpression("#{classcode}");
        xComboBox4.setItems("classificationList");
        xComboBox4.setName("classification");
        xComboBox4.setRequired(true);

        xDataTable2.setHandler("bldguseListHandler");
        xDataTable2.setImmediate(true);
        xDataTable2.setName("selectedBldgUse");
        xDataTable2.setShowRowHeader(true);

        jLabel2.setText("<html>Classification <font color=\"red\">*</font>:</html>");

        xLabel6.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel6.setForeground(new java.awt.Color(153, 0, 0));
        xLabel6.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel6.setName("errorMsg");

        xButton1.setMnemonic('d');
        xButton1.setText("Define Floor Information");
        xButton1.setDepends(new String[] {"selectedBldgUse"});
        xButton1.setName("defineFloorInfo");

        org.jdesktop.layout.GroupLayout jPanel5Layout = new org.jdesktop.layout.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(xDataTable2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 494, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel5Layout.createSequentialGroup()
                        .add(xLabel6, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 341, Short.MAX_VALUE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(jPanel5Layout.createSequentialGroup()
                        .add(jLabel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 75, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(xComboBox4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 159, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 20, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xComboBox4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xDataTable2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 187, Short.MAX_VALUE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xLabel6, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 22, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        jPanel4.add(jPanel5, java.awt.BorderLayout.CENTER);

        org.jdesktop.layout.GroupLayout jPanel6Layout = new org.jdesktop.layout.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel11, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 259, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 518, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel6Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jPanel4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 290, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, formPanel11, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 290, Short.MAX_VALUE))
                .addContainerGap())
        );
        jTabbedPane1.addTab("Building Information", jPanel6);

        org.jdesktop.layout.GroupLayout jPanel8Layout = new org.jdesktop.layout.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel8Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 808, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jTabbedPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 808, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, formPanel3, 0, 0, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel8Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 80, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jTabbedPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 340, Short.MAX_VALUE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        add(jPanel8, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel11;
    private com.rameses.rcp.util.FormPanel formPanel12;
    private com.rameses.rcp.util.FormPanel formPanel13;
    private com.rameses.rcp.util.FormPanel formPanel14;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private com.rameses.rcp.util.FormPanel formPanel3;
    private com.rameses.rcp.util.FormPanel formPanel4;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTabbedPane jTabbedPane1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XActionTextField xActionTextField3;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XCheckBox xCheckBox1;
    private com.rameses.rcp.control.XCheckBox xCheckBox2;
    private com.rameses.rcp.control.XCheckBox xCheckBox3;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XComboBox xComboBox3;
    private com.rameses.rcp.control.XComboBox xComboBox4;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XDataTable xDataTable2;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XDateField xDateField2;
    private com.rameses.rcp.control.XDateField xDateField3;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel6;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    private com.rameses.rcp.control.XNumberField xNumberField10;
    private com.rameses.rcp.control.XNumberField xNumberField2;
    private com.rameses.rcp.control.XNumberField xNumberField3;
    private com.rameses.rcp.control.XNumberField xNumberField4;
    private com.rameses.rcp.control.XNumberField xNumberField5;
    private com.rameses.rcp.control.XNumberField xNumberField6;
    private com.rameses.rcp.control.XNumberField xNumberField7;
    private com.rameses.rcp.control.XNumberField xNumberField8;
    private com.rameses.rcp.control.XNumberField xNumberField9;
    private com.rameses.rcp.control.XSeparator xSeparator1;
    private com.rameses.rcp.control.XSeparator xSeparator2;
    private com.rameses.rcp.control.XSeparator xSeparator3;
    private com.rameses.rcp.control.XSeparator xSeparator4;
    private com.rameses.rcp.control.XSeparator xSeparator5;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    // End of variables declaration//GEN-END:variables
    
}
