package user.ui;

import com.rameses.rcp.constant.TextCase;
import com.rameses.rcp.ui.annotations.StyleSheet;

/*
 * OrgPage.java
 *
 * Created on September 7, 2010, 11:12 AM
 * @author jaycverg
 */

@StyleSheet
public class UserLoginAccountFormPage extends javax.swing.JPanel {
    
    public UserLoginAccountFormPage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField4 = new com.rameses.rcp.control.XTextField();
        xCheckBox1 = new com.rameses.rcp.control.XCheckBox();
        xCheckBox3 = new com.rameses.rcp.control.XCheckBox();
        xCheckBox2 = new com.rameses.rcp.control.XCheckBox();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();

        setPreferredSize(new java.awt.Dimension(600, 418));

        formPanel1.setCaptionWidth(150);
        xTextField3.setCaption("Login ID");
        xTextField3.setName("account.uid");
        xTextField3.setPreferredSize(new java.awt.Dimension(150, 19));
        xTextField3.setRequired(true);
        xTextField3.setTextCase(TextCase.NONE);
        formPanel1.add(xTextField3);

        xTextField2.setCaption("Display Name");
        xTextField2.setName("account.displayname");
        xTextField2.setPreferredSize(new java.awt.Dimension(150, 19));
        xTextField2.setRequired(true);
        xTextField2.setTextCase(TextCase.NONE);
        formPanel1.add(xTextField2);

        xTextField4.setCaption("Email");
        xTextField4.setName("account.email");
        xTextField4.setPreferredSize(new java.awt.Dimension(250, 19));
        xTextField4.setTextCase(TextCase.NONE);
        formPanel1.add(xTextField4);

        xCheckBox1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox1.setText("Activate User ");
        xCheckBox1.setCaption("");
        xCheckBox1.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox1.setName("account.active");
        xCheckBox1.setOpaque(false);
        formPanel1.add(xCheckBox1);

        xCheckBox3.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox3.setText("Always check terminal when logging in");
        xCheckBox3.setCaption("");
        xCheckBox3.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox3.setName("account.checkterminal");
        xCheckBox3.setOpaque(false);
        formPanel1.add(xCheckBox3);

        xCheckBox2.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox2.setText("Change password on next login");
        xCheckBox2.setCaption("");
        xCheckBox2.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox2.setName("account.changepwdonlogin");
        xCheckBox2.setOpaque(false);
        formPanel1.add(xCheckBox2);

        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel3.setCaption("Last password login count");
        xLabel3.setName("account.lastpwdlogincount");
        xLabel3.setPreferredSize(new java.awt.Dimension(250, 18));
        formPanel1.add(xLabel3);

        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setCaption("Last password change date");
        xLabel2.setName("account.dtlastpwdchange");
        xLabel2.setPreferredSize(new java.awt.Dimension(250, 18));
        formPanel1.add(xLabel2);

        xActionBar1.setDynamic(true);
        xActionBar1.setName("formActions");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 454, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 371, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(136, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 31, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 204, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(166, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XCheckBox xCheckBox1;
    private com.rameses.rcp.control.XCheckBox xCheckBox2;
    private com.rameses.rcp.control.XCheckBox xCheckBox3;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    private com.rameses.rcp.control.XTextField xTextField4;
    // End of variables declaration//GEN-END:variables
    
}
