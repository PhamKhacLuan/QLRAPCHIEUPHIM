﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using BLL;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace GUI.AD_GUI
{
    public partial class UC_ThongKeChung : UserControl
    {
        public UC_ThongKeChung()
        {
            InitializeComponent();
            setGUI();
        }
        private void setGUI()
        {
            
            cbLoaiHopDong.Items.Add(new CBBItem { Text = "Tất cả", Value = "0" });
            cbLoaiHopDong.Items.AddRange(LoaiHopDongBLL.Instance.GetCBBLoaiHopDong().ToArray());
            cbLoaiHopDong.SelectedIndex = 0;
            dtpNgayKT.Value = DateTime.Today;
            dtpNgayBD.Value = DateTime.Today.AddDays(-7);
            List<ThongKeTienNhapDTO> data = ThongKeBLL.Instance.ThongKeTienNhapPhim(((CBBItem)cbLoaiHopDong.SelectedItem).Value,
                      dtpNgayBD.Value, dtpNgayKT.Value, lbSoLuongHD, lbTongTienThanhToanHD, lbDocTienThanhChu);
            LoadGDVThongKeHopDong( data);
            LoadChart(data);
            lbTongNhaCungCap.Text = ThongKeBLL.Instance.SoLuongNhaCungCap().ToString();
            lbSoLuongNhaCungCapPhim.Text = ThongKeBLL.Instance.SoLuongNhaCungCap("LNCC01").ToString();
            lbSoLuongNhaCungCapVT.Text = ThongKeBLL.Instance.SoLuongNhaCungCap("LNCC02").ToString();
            lbSoLuongNhaCungCapTA.Text = ThongKeBLL.Instance.SoLuongNhaCungCap("LNCC03").ToString();
            lbSoLuongPhimTrongKho.Text = ThongKeBLL.Instance.SoLuongPhimTrongKho().ToString();
            lbTongSoPhongChieu.Text = ThongKeBLL.Instance.SoLuongPhongChieu().ToString();
            lbSoLuongPhongChieuHong.Text = ThongKeBLL.Instance.SoLuongPhongChieu(2).ToString();
            lbSoLuongPhongChieuBaotri.Text = ThongKeBLL.Instance.SoLuongPhongChieu(3).ToString();
            lbSoLuongPhongChieuTinhTrangTot.Text = ThongKeBLL.Instance.SoLuongPhongChieu(1).ToString();
            lbSoLuongNhanVien.Text = ThongKeBLL.Instance.SoLuongNhanVien().ToString();
            lbSLNVPhim.Text = ThongKeBLL.Instance.SoLuongNhanVien("CV0001").ToString();
            lbSLNVVatTu.Text = ThongKeBLL.Instance.SoLuongNhanVien("CV0002").ToString();
            lbSoLuongNVQL.Text = ThongKeBLL.Instance.SoLuongNhanVien("CV0003").ToString();
            lbSoLuongPhimTrongKho.Text = ThongKeBLL.Instance.SoLuongPhimTrongKho().ToString();
        }
        private void LoadGDVThongKeHopDong(object item)
        {
            dgvThongKeHopDong.DataSource = item;
            dgvThongKeHopDong.Columns["MaHopDong"].HeaderText = "Mã hợp đồng";
            dgvThongKeHopDong.Columns["TenHopDong"].HeaderText = "Tên hợp đồng";
            dgvThongKeHopDong.Columns["TongTien"].HeaderText = "Tiền thanh toán(VND)";
            dgvThongKeHopDong.Columns["TenLoaiHopDong"].HeaderText = "Loại hợp đồng";
            dgvThongKeHopDong.Columns["LoaiHopDong"].Visible = false;
        }
        private void cbLoaiHopDong_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnThongKe_Click(object sender, EventArgs e)
        {
            if(cbLoaiHopDong.SelectedIndex != -1)
            {
                if (dtpNgayBD.Value <= dtpNgayKT.Value)
                {
                    List<ThongKeTienNhapDTO> data = ThongKeBLL.Instance.ThongKeTienNhapPhim(((CBBItem)cbLoaiHopDong.SelectedItem).Value,
                        dtpNgayBD.Value, dtpNgayKT.Value, lbSoLuongHD, lbTongTienThanhToanHD, lbDocTienThanhChu);
                    LoadGDVThongKeHopDong(data);
                    LoadChart(data);
                }
                else
                {
                    MessageBox.Show("Ngày chưa hợp lệ! Vui lòng kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show("Chưa chọn loại hợp đồng cần thống kê!","Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
        private void LoadChart(List<ThongKeTienNhapDTO> data)
        {
          
            chart1.Titles.Clear();
            chart1.DataSource = ThongKeBLL.Instance.GetTienHopDongTheoLoaiHD(data);
            chart1.Series["Series1"].XValueMember = "LoaiHopDong";
            chart1.Series["Series1"].YValueMembers = "TongTien";
            chart1.Titles.Add("Biểu đồ tiền thanh toán hợp đồng theo các loại (VND)");
            chart1.Series["Series1"].ChartType = SeriesChartType.Pie;
        }
    }
}
