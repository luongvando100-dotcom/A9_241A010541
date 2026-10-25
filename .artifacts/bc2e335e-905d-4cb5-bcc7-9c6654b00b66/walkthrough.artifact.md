# Hoàn thành Lab A9 – Adapter & ListView

Lab A9 đã được hoàn thành đầy đủ theo đúng yêu cầu hướng dẫn thực hành (bao gồm các phần cơ bản và tính năng nâng cao).

## 🚀 Các thành phần đã triển khai

1. **Lớp dữ liệu ([MonAn.java](file:///C:/dev/LTDD/A9_241A010541/app/src/main/java/vn/edu/vhu/ltdd/a9listview/MonAn.java)):**
   - Lưu trữ thông tin món ăn (`ten`, `moTa`, `gia`, `anhResId`).
   - Cung cấp phương thức `dinhDangGia(int gia)` để định dạng tiền tệ (VD: `45000` $\to$ `45.000 đ`) mà không dùng thư viện ngoài.

2. **Giao diện:**
   - [strings.xml](file:///C:/dev/LTDD/A9_241A010541/app/src/main/res/values/strings.xml): Bổ sung đầy đủ các chuỗi ký hiệu, thông báo lỗi, hướng dẫn, và nhãn hiển thị.
   - [item_mon_an.xml](file:///C:/dev/LTDD/A9_241A010541/app/src/main/res/layout/item_mon_an.xml): Thiết kế layout cho một dòng (`LinearLayout` ngang, `ImageView` 56x56 dp, bố cục dọc tên & mô tả, `TextView` giá).
   - [activity_main.xml](file:///C:/dev/LTDD/A9_241A010541/app/src/main/res/layout/activity_main.xml): Màn hình chính gồm tiêu đề, thông kê thống kê (NC4), ô nhập tên món, ô nhập giá, nút "Thêm món", hướng dẫn, `ListView` (`lvMonAn`) và `TextView` hiển thị danh sách trống (`tvTrong`).

3. **Adapter tự viết ([MonAnAdapter.java](file:///C:/dev/LTDD/A9_241A010541/app/src/main/java/vn/edu/vhu/ltdd/a9listview/MonAnAdapter.java)):**
   - Kế thừa `BaseAdapter`, cài đặt đủ 4 phương thức: `getCount()`, `getItem(int)`, `getItemId(int)`, `getView(...)`.
   - Áp dụng mẫu **ViewHolder** (`setTag` / `getTag`) để tái sử dụng `convertView`, đảm bảo cuộn mượt mà.
   - Triển khai tính năng nâng cao **NC2**: Tự động đổi màu nền dòng khi giá $> 45.000\text{ đ}$.

4. **MainActivity ([MainActivity.java](file:///C:/dev/LTDD/A9_241A010541/app/src/main/java/vn/edu/vhu/ltdd/a9listview/MainActivity.java)):**
   - Khởi tạo danh sách mẫu 5 món ăn (`Phở bò tái`, `Bún chả Hà Nội`, `Cơm tấm sườn`, `Bánh mì thịt nguội`, `Trà đào cam sả`).
   - Gắn Adapter vào ListView và thiết lập `setEmptyView(tvTrong)`.
   - Xử lý sự kiện chạm (`onItemClickListener`) hiển thị Toast tên món.
   - Xử lý sự kiện giữ lâu (`onItemLongClickListener`) xóa dòng và gọi `notifyDataSetChanged()`.
   - Xử lý thêm món mới (`themMon`) với kiểm tra hợp lệ (`EditText.setError`), thêm vào đầu danh sách, cuộn mượt (`smoothScrollToPosition(0)`) và cập nhật thống kê (NC4).

5. **Tài nguyên ảnh mẫu:**
   - Tạo 5 vector drawable (`mon1.xml` đến `mon5.xml`) trong `res/drawable/` để đảm bảo app biên dịch và chạy hoàn hảo không thiếu tài nguyên.

## ✅ Kiểm tra biên dịch
- Đã chạy `app:assembleDebug` và **Build thành công 100%**.
