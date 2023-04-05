GEAR3S DATABASE DOCUMENT
Db gear3s_db bao gồm 18 bảng
//-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*//
1. Bảng Roles (Quyền): admin, user...
 Bao gồm các trường: id(khóa chính); name(độc nhất): tên quyền; description: miêu tả về quyền

2. Bảng Sex (Giới tính): Nam, nữ, khác...
 Bao gồm các trường: id(khóa chính); name(độc nhất): tên giới tính

3. Bảng Users (Thông tin người dùng)
 Bao gồm các trường: id(khóa chính); email(độc nhất): tên email để đăng nhập, lúc tạo tài khoản bắt buộc phải là định dạng của Email(có @) thì dưới backend mới cho tạo; password: mật khẩu đăng nhập, lưu dưới dạng mã hóa ở db; fullname: tên người dùng; birthday: ngày sinh nhật; phone: số điện thoại; address: địa chỉ để ship hàng; avatar: link ảnh đại diện của người dùng, lưu cả link gốc hoặc chỉ lưu tên ảnh; last_payment: lưu id của MyCard ở lần thanh toán cuối cùng của người dùng, lúc khởi tạo mặc định là 0; role_id(khóa ngoại): là khóa chính của bảng Roles, lúc tạo tài khoản mặc định là ROLE_USER; sex_id(khóa ngoại): là khóa chính của bảng Sex

4. Bảng MyCard (Thẻ thanh toán)
 Bao gồm các trường: id(khóa chính); number(độc nhất): số trên thẻ; name: tên trên thẻ; expiry_date: thời hạn hết hạn của thẻ; cvv: mật khẩu 3 số để thanh toán, nằm sau thẻ

5. Bảng User_Card (Thẻ của người dùng): một người dùng có thể có nhiều thẻ, một thẻ có thể có nhiều người dùng
 Bao gồm các trường: id(khóa chính); user_id(khóa ngoại): là khóa chính của bảng Users; mycard_id(khóa ngoại): là khóa chính của bảng MyCard

6. Bảng Order_Status (Trạng thái thanh toán của đơn hàng): Chờ thành toán, thành công, hủy đơn...
 Bao gồm các trường: id(khóa chính); name(độc nhất): tên của trạng thái thanh toán

7. Bảng Shipping (Cách tính tiền ship): nội thành giá 50k, miền nam 100k, miền trung 150k...
 Bao gồm các trường: id(khóa chính); name(độc nhất): vị trí tương đối của người mua hàng; price: giá tiền tương ứng

8. Bảng Order (Đơn đặt hàng tổng)
 Bao gồm các trường: id(khóa chính); date: ngày tạo đơn hàng; total: tổng giá tiền đơn hàng; shipping_address: nếu người mua muốn sử dụng địa chỉ khác với địa chỉ đã đăng ký trong tài khoản cá nhân thì điền vào đây; user_id(khóa ngoại): là khóa chính của bảng User; user_card_id(khóa ngoại): là khóa chính của bảng User_Card; shipping_id(khóa ngoại): là khóa chính của bảng Shipping; status_id(khóa ngoại): là khóa chính của bảng Order

9. Bảng Order_Item (Đơn đặt hàng chi tiết): Nêu rõ những món hàng mua là gì,số lượng và tổng tiền của mỗi mặt hàng
 Bao gồm các trường: id(khóa chính); amount: số lượng của từng mặt hàng; subtotal: tổng tiền của mỗi mặt, = đơn giá x số lượng; order_id(khóa ngoại): là khóa chính của bảng Order; product_id(khóa ngoại): là khóa chính của bảng Product

10. Product_Rating (Đánh giá của người mua về mặt hàng)
 Bao gồm các trường: id(khóa chính); star: số sao đánh giá của người mua cho mặt hàng; comment: bình luận của người mua; user_id(khóa ngoại): là khóa chính của bảng Users; product_id(khóa ngoại): là khóa chính của bảng Product

11. Bảng Image (Thông tin hình ảnh)
 Bao gồm các trường: id(khóa chính); name: tên của ảnh sản phẩm, lưu theo format Số_id_sản_phẩm-Số_thứ_tự_của_ảnh.tên_đuôi_file, vd sản phẩm có id là 2 và có 3 ảnh thì tên ảnh lần lượt là 1-1.jpg, 1-2.jpg, 1-3.jpg, khi trả data về cho client thì backend sẽ kèm theo đường link ảnh vào cho tiện

12. Bảng Product_Image (Ảnh của sản phẩm): một sản phẩm sẽ có nhiều ảnh
 Bao gồm các trường: id(khóa chính); product_id(khóa ngoại): là khóa chính của bảng Product; image_id(khóa ngoại): là khóa chính của bảng Image

13. Bảng Manufacturer (Nhà sản xuất, thương hiệu của sản phẩm): Sony, Apple, Dell...
 Bao gồm các trường: id(khóa chính); name(độc nhất): tên của nhà sản xuất, thương hiệu, thương hiệu và nhà sản xuất có thể không giống như nhưng ở đây ta tính chung là một

14. Bảng Discount (Giảm giá sản phẩm)
 Bao gồm các trường: id(khóa chính); code(độc nhất): mã giảm giá cho sản phẩm; discount_per: số phần trăm được giảm, tính theo số nguyên 10 20 30%..., không phải tính theo tỷ lệ phần trăm; start_date: ngày bắt đầu giảm giá; end_date: ngày kết thúc giảm giá; description: mô tả về chương trình giảm giá, nhân dịp gì đó...

15. Bảng Product (Thông tin sản phẩm)
 Bao gồm các trường: id(khóa chính); name(độc nhất): tên sản phẩm, có thể viết kèm theo các thông tin cơ bản của sản phẩm, vd như Laptop Macbook Pro 14inch M2 512Gb...; price_origin: giá gốc của sản phẩm; price_discount: giá sản phẩm sau khi được giảm, sẽ tự động được tính khi thêm mã giảm giá vào, mặc định bằng giá gốc nếu không có mã giảm; inventory: số lượng hàng còn trong kho, bị trừ đi khi sản phẩm được bán; sold_qty: số lượng hàng đã bán được, được cộng lên khi sản phẩm được bán, lúc khởi tạo sản phẩm mặc định bằng 0; description: Mô tả sơ bộ về sản phẩm, vd như sản phẩm bán chạy nhất năm 2022, chế độ bảo hành đa quốc gia...; discount_id(khóa ngoại): là khóa chính của bảng Discount; manufacturer_id(khóa ngoại): là khóa chính của bảng Manufacturer; category_id(khóa ngoại): là khóa chính của bảng Category

16. Bảng Category (Phân loại sản phẩm): Laptop, tai nghe, bàn phím...
 Bao gồm các trường: id(khóa chính); name(độc nhất): tên của hạng mục phân loại

17. Bảng Category_Property (Đặc tính riêng của hạng mục phân loại): mỗi loại sẽ có các đặc tính khác nhau, vd như laptop sẽ có đặc tính kích thước màn hình, ram, bộ nhớ, còn tai nghe thì có các đặc tính wireless hay không, bluetooth 5 hay 6...
 Bao gồm các trường: id(khóa chính); name(độc nhất, mặc dù có nhiều loại sản phẩm có cùng đặc tính như bàn phím và tai nghe đều có chung đặc tính wireless or not nhưng để tiện cho chức năng filter, ta thống nhất tách riêng từng đặc tính của mỗi loại): tên của đặc tính; userFilter: nếu muốn lọc đặc tính này thì set là true, còn bỏ qua không muốn lọc thì là false ; category_id(khóa ngoại): là khóa chính của bảng Category

18. Bảng Product_Property (Chi tiết các thông số, đặc tính của sản phẩm)
 Bao gồm các trường: id(khóa chính); description: miêu tả chi tiết, thông số của đặc tính, vd như màn hình có đặc tính tần số quét là 144Hz, kích thước màn hình 27inch, độ phân giải 2K...; prodcut_id(khóa ngoại): là khóa chính của bảng Product; cate_property_id(khóa ngoại): là khóa chính của bảng Category_Property
 





