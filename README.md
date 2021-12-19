# pet-spa
- Lưu ý: lúc push phải chủ ý xem có push vào main ko
- Cách lấy dữ liệu từ main vào branch
     + git checkout têm_branch_của_mình
     + git pull origin main   
     + git merge main
- Import database dùng cái example_update.sql
- Đọc dữ liệu db trong java thì dùng exceQuerry còn thêm sửa xoá dùng exceUpdate
- test thì dùng tạo public static void main(){} chạy bằng cách ấn shift+f6
- Cách đặt tên 
    + Đọc (chỉ đọc các thuộc tính không phải trìu tượng) Đọc có điều kiện (getBy+Điều kiện), Đọc hết (getAll) >Chú ý kiểm tra xem ngayxoa is null (nếu có trường ngayxoa)
    + Dọc cả các thuộc tính trìu tượng ví dụ HoaDon đọc cả KháchHang thì ghi là getWithPreloadKhachHangBy+điều_kiện()
    + Thêm : insert(tên_biến_muốn_thêm) .Ví dụ insert(DichVu dv)
    + Sửa : update (tên_biến_muốn_thêm) .Ví dụ update(DichVu dv)
    + Xoá : không dùng truy vấn delete mà dùng truy vấn update để set ngayxoa= localDatetime.now( có thẻ dùng luôn hàm update ở trên)