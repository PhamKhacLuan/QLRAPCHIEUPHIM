﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DTO;

namespace GUI.QLVT_GUI
{
    public partial class UCMenuDeXuatQLVT : UserControl
    {
        NhanVienDTO nhanVien = new NhanVienDTO();
        
        public delegate void Mydel(UserControl c);
        public Mydel d { get; set; }
        public UCDaDeXuatVatTuQLVT ucDaDeXuatVatTu;
        public UCDaDeXuatThucAnQLVT ucDaDeXuatThucAnQLVT;
        public UCMenuDeXuatQLVT(NhanVienDTO NV)
        {
            nhanVien = NV;
            ucDaDeXuatVatTu = new UCDaDeXuatVatTuQLVT(nhanVien);
            ucDaDeXuatThucAnQLVT = new UCDaDeXuatThucAnQLVT(nhanVien);
            InitializeComponent();
        }
        private void btnMenuListDXThucAn_Click(object sender, EventArgs e)
        {
           
            d(ucDaDeXuatThucAnQLVT);
            
            changeColorButton(btnMenuListDXThucAn); 
        }

        private void btnMenuListDXVatTu_Click(object sender, EventArgs e)
        {
            
            d(ucDaDeXuatVatTu);
            changeColorButton(btnMenuListDXVatTu);
        }
        private void changeColorButton(Button btn)
        {
            btn.BackColor = Color.FromArgb(0, 144, 153); 
            List<Button> buttons = new List<Button> { btnMenuListDXThucAn, btnMenuListDXVatTu };
            foreach (Button i in buttons)
            {

                if (i.BackColor == Color.FromArgb(0, 144, 153) && i != btn) 
                {
                    i.BackColor = Color.FromArgb(226, 251, 242); 
                }
            }
        }
        public void setColor()
        {
            btnMenuListDXThucAn.BackColor = Color.FromArgb(0, 144, 153);
            btnMenuListDXVatTu.BackColor = Color.FromArgb(226, 251, 242);
        }

    }
}
