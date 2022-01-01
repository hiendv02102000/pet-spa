DROP TRIGGER IF EXISTS after_insert_hoadon;
CREATE TRIGGER after_insert_hoadon
    BEFORE insert ON pet_spa.tblhoadon
    FOR EACH ROW 
 Update pet_spa.tblkhachhang
 set tichluy = tichluy + new.thanhtien
 where id = new.tblKhachHangid
