/*
 * WelcomePage.java
 *
 * Created on November 3, 2010, 4:55 PM
 */

package etracs2.prov;

/**
 *
 * @author  jzamss
 */
public class WelcomePage extends javax.swing.JPanel {
    
    /** Creates new form WelcomePage */
    public WelcomePage() {
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
        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        jPanel3 = new javax.swing.JPanel();

        setLayout(new java.awt.BorderLayout());

        setBackground(new java.awt.Color(255, 255, 255));
        jPanel2.setLayout(null);

        jPanel2.setPreferredSize(new java.awt.Dimension(100, 120));
        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 18));
        jLabel1.setForeground(new java.awt.Color(0, 51, 153));
        jLabel1.setText("Welcome to");
        jPanel2.add(jLabel1);
        jLabel1.setBounds(32, 20, 206, 22);

        jLabel3.setBackground(new java.awt.Color(0, 51, 153));
        jLabel3.setOpaque(true);
        jLabel3.setPreferredSize(new java.awt.Dimension(300, 14));
        jPanel2.add(jLabel3);
        jLabel3.setBounds(30, 94, 1500, 6);

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 48));
        jLabel2.setForeground(new java.awt.Color(0, 51, 153));
        jLabel2.setText("ETRACS");
        jPanel2.add(jLabel2);
        jLabel2.setBounds(26, 36, 189, 58);

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14));
        jLabel4.setForeground(new java.awt.Color(0, 51, 153));
        jLabel4.setText("version 2.0");
        jPanel2.add(jLabel4);
        jLabel4.setBounds(226, 68, 206, 22);

        add(jPanel2, java.awt.BorderLayout.NORTH);

        jPanel1.setLayout(new java.awt.BorderLayout());

        jPanel1.setBorder(javax.swing.BorderFactory.createEmptyBorder(20, 60, 10, 10));
        xActionBar1.setButtonCaptionOrientation(javax.swing.SwingConstants.BOTTOM);
        xActionBar1.setName("formActions");
        xActionBar1.setOpaque(false);
        xActionBar1.setOrientation(com.rameses.rcp.constant.UIConstants.FLOW);
        xActionBar1.setSpacing(25);
        jPanel1.add(xActionBar1, java.awt.BorderLayout.CENTER);

        jPanel3.setOpaque(false);
        jPanel3.setPreferredSize(new java.awt.Dimension(250, 100));
        jPanel1.add(jPanel3, java.awt.BorderLayout.EAST);

        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    // End of variables declaration//GEN-END:variables
    
}
