package user.ui;


import com.rameses.rcp.ui.annotations.StyleSheet;
import com.rameses.rcp.ui.annotations.Template;
import templates.PopupTemplate;


/*
 * OrgPage.java
 *
 * Created on September 7, 2010, 11:12 AM
 * @author jaycverg
 */

@StyleSheet
@Template(PopupTemplate.class)
public class LoginAccountChangePwdPage extends javax.swing.JPanel {
    
    public LoginAccountChangePwdPage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel1 = new javax.swing.JPanel();
        jPanel7 = new javax.swing.JPanel();
        xRadio1 = new com.rameses.rcp.control.XRadio();
        xRadio2 = new com.rameses.rcp.control.XRadio();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xPasswordField1 = new com.rameses.rcp.control.XPasswordField();
        xPasswordField2 = new com.rameses.rcp.control.XPasswordField();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(354, 271));
        jPanel1.setPreferredSize(new java.awt.Dimension(347, 191));
        xRadio1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xRadio1.setText("Use System Password");
        xRadio1.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xRadio1.setName("useSystemPwd");
        xRadio1.setOpaque(false);
        xRadio1.setOptionValue(true);

        xRadio2.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xRadio2.setText("Specify password");
        xRadio2.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xRadio2.setName("useSystemPwd");
        xRadio2.setOpaque(false);
        xRadio2.setOptionValue(false);

        formPanel2.setCaptionWidth(120);
        xPasswordField1.setText("xPasswordField1");
        xPasswordField1.setCaption("Password");
        xPasswordField1.setDepends(new String[] {"useSystemPwd"});
        xPasswordField1.setName("pwd");
        xPasswordField1.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel2.add(xPasswordField1);

        xPasswordField2.setText("xPasswordField1");
        xPasswordField2.setCaption("Confirm Password");
        xPasswordField2.setDepends(new String[] {"useSystemPwd"});
        xPasswordField2.setName("confirmPwd");
        xPasswordField2.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel2.add(xPasswordField2);

        org.jdesktop.layout.GroupLayout jPanel7Layout = new org.jdesktop.layout.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel7Layout.createSequentialGroup()
                .add(jPanel7Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jPanel7Layout.createSequentialGroup()
                        .add(19, 19, 19)
                        .add(jPanel7Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(xRadio2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 236, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                            .add(xRadio1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 236, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                    .add(jPanel7Layout.createSequentialGroup()
                        .add(36, 36, 36)
                        .add(formPanel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 281, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .add(xRadio1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xRadio2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 15, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 61, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(55, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel7, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel7, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel7;
    private com.rameses.rcp.control.XPasswordField xPasswordField1;
    private com.rameses.rcp.control.XPasswordField xPasswordField2;
    private com.rameses.rcp.control.XRadio xRadio1;
    private com.rameses.rcp.control.XRadio xRadio2;
    // End of variables declaration//GEN-END:variables
    
}
