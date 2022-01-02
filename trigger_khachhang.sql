DROP TRIGGER IF EXISTS after_insert_hoadon2;
CREATE TRIGGER after_insert_hoadon2
    After insert ON pet_spa.tblhoadon
    FOR EACH ROW 
    
 Update pet_spa.tblkhachhang
 set tblLoaiKhachHangid=2
 where tichluy >= 30000000 and tichluy <60000000;
