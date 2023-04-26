GEAR3S DATABASE DOCUMENT
Db gear3s_db bao gồm 18 bảng
//-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*//
1. Bảng Roles (Quyền): admin, user...
 Bao gồm các trường: 
	* id(khóa chính)
	* name(độc nhất): tên quyền
	* description: miêu tả về quyền

2. Bảng Sex (Giới tính): Nam, nữ, khác...
 Bao gồm các trường: 
	* id(khóa chính)
	* name(độc nhất): tên giới tính

3. Bảng Users (Thông tin người dùng)
 Bao gồm các trường:
	* id(khóa chính)
	* email(độc nhất): tên email để đăng nhập, lúc tạo tài khoản bắt buộc phải là định dạng của Email(có @) thì backend mới cho tạo
	* password: mật khẩu đăng nhập, lưu dưới dạng mã hóa ở db
	* fullname: tên người dùng
	* birthday: ngày sinh nhật của người dùng
	* phone: số điện thoại của người dùng
	* address: địa chỉ cùa người dùng để ship hàng
	* avatar: ảnh đại diện của người dùng, lưu tên ảnh+định dạng đuôi file
	* last_payment: lưu id của UserCard ở lần thanh toán cuối cùng của người dùng, lúc khởi tạo mặc định là 0
	* role_id(khóa ngoại): là khóa chính của bảng Roles, lúc tạo tài khoản mặc định là ROLE_USER
	* sex_id(khóa ngoại): là khóa chính của bảng Sex

4. Bảng MyCard (Thẻ thanh toán)
 Bao gồm các trường:
	* id(khóa chính)
	* number(độc nhất): số in trên thẻ
	* name: tên in trên thẻ
	* expiry_date: thời hạn hết hạn của thẻ
	* cvv: mật khẩu 3 số để thanh toán, nằm sau thẻ, lưu dưới dạng mã hóa ở db

5. Bảng User_Card (Thẻ của người dùng): một người dùng có thể có nhiều thẻ, một thẻ có thể có nhiều người dùng
 Bao gồm các trường:
	* id(khóa chính)
	* user_id(khóa ngoại): là khóa chính của bảng Users
	* mycard_id(khóa ngoại): là khóa chính của bảng MyCard

6. Bảng Order_Status (Trạng thái thanh toán của đơn hàng): Chờ thành toán, thành công, hủy đơn...
 Bao gồm các trường:
	* id(khóa chính)
	* name(độc nhất): tên của trạng thái thanh toán

7. Bảng Shipping (Cách tính tiền ship): nội thành giá 50k, ngoại thành 100k...
 Bao gồm các trường:
	* id(khóa chính)
	* name(độc nhất): khu vực giao hàng
	* price: giá tiền ship tương ứng với khu vực

8. Bảng Order (Đơn đặt hàng tổng)
 Bao gồm các trường:
	* id(khóa chính)
	* date: ngày tạo đơn hàng
	* total: tổng giá tiền đơn hàng
	* shipping_address: địa chỉ khác nếu người mua không muốn sử dụng địa chỉ đã đăng ký trong tài khoản cá nhân
	* user_card_id(khóa ngoại): là khóa chính của bảng User_Card
	* shipping_id(khóa ngoại): là khóa chính của bảng Shipping
	* status_id(khóa ngoại): là khóa chính của bảng Order

9. Bảng Order_Item (Đơn đặt hàng chi tiết): Nêu rõ những món hàng mua là gì,số lượng và tổng tiền của mỗi mặt hàng
 Bao gồm các trường:
	* id(khóa chính)
	* amount: số lượng của từng mặt hàng
	* subtotal: tổng tiền của mỗi mặt, = đơn giá x số lượng
	* order_id(khóa ngoại): là khóa chính của bảng Order
	* product_id(khóa ngoại): là khóa chính của bảng Product

10. Product_Rating (Đánh giá của người mua về mặt hàng)
 Bao gồm các trường:
	* id(khóa chính)
	* star: số sao đánh giá của người mua cho mặt hàng
	* comment: bình luận của người mua
	* user_id(khóa ngoại): là khóa chính của bảng Users
	* product_id(khóa ngoại): là khóa chính của bảng Product

11. Bảng Product (Thông tin sản phẩm)
 Bao gồm các trường:
	* id(khóa chính)
	* name(độc nhất): tên sản phẩm, có thể viết kèm theo các thông tin cơ bản của sản phẩm, vd như Laptop Macbook Pro 14inch M2 512Gb...
	* create_date: ngày tạo sản phẩm, dùng cho sort by latest
	* price_origin: giá gốc của sản phẩm
	* price_discount: giá sản phẩm sau khi được giảm, dùng cho sort by low to high và high to low, filter by price range
	* inventory: số lượng hàng còn trong kho, bị trừ đi khi sản phẩm được bán
	* sold_qty: số lượng hàng đã bán được, được cộng lên khi sản phẩm được bán, lúc khởi tạo sản phẩm mặc định bằng 0, dùng cho sort by top sales
	* view_qty: số lượt xem của sản phẩm, +1 khi bấm vào xem chi tiết sản phẩm, dùng cho sort by popular
	* description: mô tả sơ bộ về sản phẩm, vd như sản phẩm bán chạy nhất năm 2022, chế độ bảo hành đa quốc gia...
	* category_id(khóa ngoại): là khóa chính của bảng Category

12. Bảng Category (Phân loại sản phẩm): Laptop, tai nghe, bàn phím...
 Bao gồm các trường:
	* id(khóa chính)
	* name(độc nhất): tên của hạng mục phân loại sản phẩm

13. Bảng Category_Property (Đặc tính của từng loại sản phẩm): mỗi loại sản phẩm sẽ có các đặc tính khác nhau, vd như laptop sẽ có đặc tính kích thước màn hình, ram, bộ nhớ, còn tai nghe thì có các đặc tính wireless hay không, bluetooth 5 hay 6..., mặc dù có nhiều loại sản phẩm có cùng đặc tính như bàn phím và tai nghe đều có chung đặc tính wireless hay không nhưng để tiện cho chức năng filter, ta thống nhất tách riêng từng đặc tính của mỗi loại
 Bao gồm các trường:
	* id(khóa chính)
	* name(độc nhất): tên của đặc tính
	* category_id(khóa ngoại): là khóa chính của bảng Category

14. Bảng Product_Desc (tên đúng là Property_Desc, vì ban đầu lỡ tạo tên Product_Desc nên thôi dùng luôn :D ): mỗi đặc tính sẽ được phân loại, miêu tả chi tiết, vd như đặc tính RAM của PC sẽ có 8Gb, 16Gb, 32Gb,...
 Bao gồm các trường:
	* id(khóa chính)
	* description: tên miêu tả chi tiết của đặc tính
	* cate_property_id(khóa ngoại): là khóa chính của bảng Category_Property

15. Bảng Product_Property: Miêu tả chi tiết thông số dựa trên đặc tính của sản phẩm, vd như màn hình có đặc tính tần số quét là 144Hz, kích thước màn hình 27inch, độ phân giải 2K... 
 Bao gồm các trường:
	* id(khóa chính)
	* product_id(khóa ngoại): là khóa chính của bảng Product
	* prod_desc_id(khóa ngoại): là khóa chính của bảng Product_Desc
 





