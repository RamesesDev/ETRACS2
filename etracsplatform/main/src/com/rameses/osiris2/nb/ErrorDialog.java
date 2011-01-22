package com.rameses.osiris2.nb;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Dialog;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Frame;
import java.awt.KeyboardFocusManager;
import java.awt.Toolkit;
import java.awt.Window;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.KeyStroke;
import javax.swing.SwingConstants;
import javax.swing.UIManager;

public class ErrorDialog 
{
    
    public static void show(String message) {
        show(new Exception(message));
    }
    
    public static void show(Throwable throwable) {
        show(throwable, null);
    }
    
    public static void show(Throwable throwable, Component component)
    {
        ErrorDialog ed = new ErrorDialog(throwable, component);
        ed.show0();
    }    
    
    
    private Throwable throwable;
    private Component component;
    
    private ErrorDialog(Throwable throwable, Component component) 
    {
        this.throwable = throwable;
        this.component = component;
    }
    
    private void show0()
    {
        Window win = KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusedWindow();
        CustomDialog cd = null;
        if (win instanceof Dialog)
            cd = new CustomDialog((Dialog) win);
        else if (win instanceof Frame)
            cd = new CustomDialog((Frame) win);
        else
            cd = new CustomDialog((Frame) null);

        String msg = getMessage(throwable);
        cd.setMessage((msg != null ? msg : ""));
        cd.setTitle("Error");
        cd.setResizable(false);
        cd.pack();

        if (component != null) 
            cd.setLocationRelativeTo(component);
        
        centerWindow(cd);
        cd.setVisible(true);
    }

    private void centerWindow(Window win)
    {
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        Dimension winSize = win.getSize();
        int x = (screenSize.width / 2) - (winSize.width / 2);
        int y = (screenSize.height / 2) - (winSize.height / 2);
        win.setLocation(x, y);
    }
    
    private String getMessage(Throwable t)
    {
        if (t == null) return null;
        
        String msg = t.getMessage();
        Throwable cause = t.getCause();
        while (cause != null)
        {
            String s = cause.getMessage();
            if (s != null) msg = s;
            
            cause = cause.getCause();
        }
        return msg;
    }    
    
    // <editor-fold defaultstate="collapsed" desc=" CustomDialog (Class) ">
    private class CustomDialog extends JDialog
    {
        JPanel container;
        JLabel lblIcon;
        JLabel lblMessage;
        ThrowableView view;
        int maxWidth = 700;
        
        CustomDialog(Dialog owner)
        {
            super(owner, true);
            initComponents();
        }
        
        CustomDialog(Frame owner)
        {
            super(owner, true);
            initComponents();
        }
        
        void setMessage(String message) 
        {
            if (message != null)
            {
                StringBuffer sb = new StringBuffer();
                sb.append("<html>" + message.replaceAll("\\n", "<br>") + "</html>");
                lblMessage.setText(sb.toString());
                Dimension dim = lblMessage.getPreferredSize();
                
                if (dim.width > maxWidth)
                {
                    int parts = dim.width / maxWidth;
                    if (dim.width % maxWidth > 0) parts += 1;
                    
                    int height = dim.height * parts;
                    lblMessage.setPreferredSize(new Dimension(maxWidth, height));
                }
                else if (dim.width < 500)
                    lblMessage.setPreferredSize(new Dimension(500, dim.height));
                    
            }
            else
                lblMessage.setText("");
        }
        
        // <editor-fold defaultstate="collapsed" desc=" initComponents ">
        private void initComponents()
        {
            //setDefaultCloseOperation(DISPOSE_ON_CLOSE);
            container = new JPanel(new BorderLayout());
        
            view = new ThrowableView();
            JPanel pnlView = new JPanel(new BorderLayout());
            pnlView.setBorder(BorderFactory.createEmptyBorder(0,15,15,15));
            pnlView.setPreferredSize(new Dimension(100,200));
            pnlView.add(view);
            pnlView.setVisible(false);
            
            lblIcon = new JLabel();
            lblIcon.setIcon(UIManager.getIcon("OptionPane.errorIcon"));
            lblIcon.setVerticalAlignment(SwingConstants.TOP);
            
            lblMessage = new JLabel("Error Message");
            lblMessage.setVerticalAlignment(SwingConstants.TOP);
            lblMessage.setBorder(BorderFactory.createEmptyBorder(3,15,0,20));

            JPanel pnlIcon = new JPanel(new BorderLayout());
            pnlIcon.add(lblIcon, BorderLayout.NORTH);
            
            JPanel boxTop = new JPanel(new BorderLayout());
            container.add(boxTop, BorderLayout.NORTH);
            
            boxTop.setBorder(BorderFactory.createEmptyBorder(10,10,10,0));
            boxTop.add(pnlIcon, BorderLayout.WEST);
            boxTop.add(lblMessage);
            
            JPanel pnlSouth = new JPanel(new BorderLayout());
            container.add(pnlSouth, BorderLayout.SOUTH);
            
            Box boxButtons = new Box(BoxLayout.LINE_AXIS);
            pnlSouth.add(boxButtons, BorderLayout.NORTH);
            pnlSouth.add(pnlView, BorderLayout.SOUTH);
            
            boxButtons.setBorder(BorderFactory.createEmptyBorder(10,15,10,20));
            boxButtons.add(createButton("Details >>", "showDetails", 'd', true));
            boxButtons.add(createButton("Details <<", "hideDetails", 'd', false));
            boxButtons.add(Box.createHorizontalGlue());
            
            JButton defaultButton = createButton("OK", "OK", '\u0000', true);
            defaultButton.setFocusable(true);
            getRootPane().setDefaultButton(defaultButton);
            
            boxButtons.add(defaultButton);
            Dimension btnDim = defaultButton.getPreferredSize();
            defaultButton.setPreferredSize(new Dimension(70, btnDim.height));
            
//            boxButtons.add(Box.createHorizontalStrut(50));
//            boxButtons.add(Box.createHorizontalGlue());
            setContentPane(container);
            
            addWindowListener(new WindowAdapter() 
            {
                public void windowActivated(WindowEvent e) 
                {
                    JButton btn = getRootPane().getDefaultButton();
                    if (btn == null) return;
                    
                    btn.grabFocus();
                }
            });
            
            CancelWindowAction cwa = new CancelWindowAction(this);
            container.registerKeyboardAction(cwa, cwa.getKeyStroke(), JComponent.WHEN_IN_FOCUSED_WINDOW);
        }
        // </editor-fold>  
        
        private JButton createButton(String text, String actionCommand, char mnemonic, boolean visible)
        {
            JButton btn = new JButton(text);
            btn.setActionCommand(actionCommand);
            btn.setVisible(visible);
            btn.setFocusable(false);
            btn.addActionListener(new ActionListener() 
            {
                public void actionPerformed(ActionEvent e) { perform(e); }
            });
            
            if (mnemonic != '\u0000') btn.setMnemonic(mnemonic);
            
            container.putClientProperty("Button." + actionCommand, btn);
            return btn;
        }
        
        private void perform(ActionEvent e)
        {
            String cmd = e.getActionCommand();
            JButton btn = (JButton) e.getSource();
            if ("OK".equals(cmd))
                dispose();
            
            else if ("showDetails".equals(cmd))
            {
                view.getParent().setVisible(true);
                view.print(throwable);
                pack();
                
                btn.setVisible(false);
                ((JComponent) container.getClientProperty("Button.hideDetails")).setVisible(true);
                
                Dimension size = getSize();
                setSize(size.width, size.height);                
            }
            else if ("hideDetails".equals(cmd))
            {
                view.getParent().setVisible(false);
                pack();
                
                btn.setVisible(false);
                ((JComponent) container.getClientProperty("Button.showDetails")).setVisible(true);
                
                Dimension size = getSize();
                setSize(size.width, size.height);
            }
        }
    }
    // </editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc=" ThrowableView (Class) ">
    private class ThrowableView extends JScrollPane
    {
        JTextArea field;
        
        ThrowableView()
        {
            field = new JTextArea();
            field.setBorder(BorderFactory.createEmptyBorder(3,3,0,0));
            field.setEditable(false);
            
            Font font = field.getFont();
            field.setFont(new Font(font.getFontName(), Font.PLAIN, 11));
            setViewportView(field);
        }
        
        void print(Throwable throwable)
        {
            CustomWriter writer = new CustomWriter();
            if (throwable != null)
                throwable.printStackTrace(new PrintWriter(writer));
            
            field.setText(writer.getText());
        }
    }
    // </editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc=" CustomWriter (Class) ">
    private class CustomWriter extends Writer
    {
        StringBuffer buffer = new StringBuffer();
        
        public void write(char[] cbuf, int off, int len) throws IOException {
            buffer.append(cbuf, off, len);
        }

        public String getText() { return buffer.toString(); }
        
        public void flush() throws IOException {;}
        public void close() throws IOException {;}
    }
    // </editor-fold>
 
    // <editor-fold defaultstate="collapsed" desc=" CancelWindowAction (Class) ">
    private class CancelWindowAction implements ActionListener
    {
        JDialog dialog;
        KeyStroke keyStroke;
        
        CancelWindowAction(JDialog dialog) 
        { 
            this.dialog = dialog; 
            
            keyStroke = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0, false);
        }

        public KeyStroke getKeyStroke() { return keyStroke; }
        public void actionPerformed(ActionEvent e) { dialog.dispose(); }
    }
    // </editor-fold>
    
}
