﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ChiTietPhongChieuView
    {
        private string maPhongChieu;
        private string maVatTu;
        private string tenVatTu;
        private string donViTinh;
        private int soLuong;

        public string MaPhongChieu { get => maPhongChieu; set => maPhongChieu = value; }
        public string MaVatTu { get => maVatTu; set => maVatTu = value; }
        public string TenVatTu { get => tenVatTu; set => tenVatTu = value; }
        public string DonViTinh { get => donViTinh; set => donViTinh = value; }
        public int SoLuong { get => soLuong; set => soLuong = value; }
        
    }
}
