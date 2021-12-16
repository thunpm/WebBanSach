DROP DATABASE IF EXISTS WebBanSach

CREATE DATABASE WebBanSach

USE WebBanSach

CREATE TABLE KHACHHANG (
	Id varchar(10) not null,
	TenDangNhap varchar(50) not null,
	HoTen nvarchar(50),
	SoDienThoai varchar(12) not null,
	MatKhau varchar(50) not null,
	Email varchar(50),
	GioiTinh nvarchar(10),
	NgaySinh date,
	del_flag bit default(1),

	primary key (id),
	unique (SoDienThoai),
	unique (TenDangNhap)
)

INSERT INTO KHACHHANG
	(Id, TenDangNhap, HoTen, SoDienThoai, MatKhau, Email, GioiTinh, NgaySinh)
VALUES 
	('KH0001', 'thu', N'Nguyễn Phan Minh Thư', '0898154428', '123', 'minhthu20201@gmail.com', N'Nữ', '02/20/2001')

CREATE TABLE DANHMUCSANPHAM (
	Id varchar(10) not null,
	TenDanhMuc nvarchar(50) not null,
	del_flag bit default(1),
	
	primary key (id)
)

INSERT INTO DANHMUCSANPHAM
	(Id, TenDanhMuc)
VALUES 
	('DM01', N'Sách trong nước'),
	('DM02', N'Foreign Book'),
	('DM03', N'Văn phòng phẩm'),
	('DM04', N'Lưu niệm')

CREATE TABLE LOAISANPHAM (
	Id varchar(10) not null,
	TenLoaiSanPham nvarchar(50) not null,
	IdDanhMuc varchar(10) not null,
	del_flag bit default(1),

	primary key (Id),
	constraint fk_danhmuc_loai
	foreign key (IdDanhMuc)
	references DANHMUCSANPHAM(Id)
)

INSERT INTO LOAISANPHAM 
	(Id, TenLoaiSanPham, IdDanhMuc)
VALUES 
	('LSP01', N'Văn học', 'DM01'),
	('LSP02', N'Kinh tế', 'DM01'),
	('LSP03', N'Tâm lý - Kỹ năng sống', 'DM01'),
	('LSP04', N'Tiểu sử - Hồi ký', 'DM01'),
	('LSP05', N'Nuôi dạy con', 'DM01'),
	('LSP06', N'Sách thiếu nhi', 'DM01'),
	('LSP07', N'Sách Giáo khoa - Tham khảo', 'DM01'),
	('LSP08', N'Sách học ngoại ngữ', 'DM01'),
	('LSP09', N'Fiction', 'DM02'),
	('LSP10', N'Business and Management', 'DM02'),
	('LSP11', N'Personal Development', 'DM02'),
	('LSP12', N'Children''s Book', 'DM02'),
	('LSP13', N'Dictionaries and Languages', 'DM02'),
	('LSP14', N'Dụng cụ học sinh', 'DM03'),
	('LSP15', N'Dụng cụ văn phòng', 'DM03'),
	('LSP16', N'Dụng cụ vẽ', 'DM03'),
	('LSP17',  N'Đồ lưu niệm', 'DM04')

CREATE TABLE SANPHAM (
	Id varchar(10) not null,
	TenSanPham nvarchar(max) not null,
	TacGia nvarchar(50),
	NhaXuatBan nvarchar(50),
	Gia money,
	KhuyenMai int,
	SoLuongCo int,
	MoTa nvarchar(max),
	IdTheLoai varchar(10) not null,
	del_flag bit default(1),

	primary key (Id),
	constraint fk_loai_sanpham
	foreign key (IdTheLoai)
	references LOAISANPHAM(Id)
)

INSERT INTO SANPHAM 
	(Id, TenSanPham, TacGia, NhaXuatBan, Gia, KhuyenMai, SoLuongCo, MoTa, IdTheLoai)
VALUES
	('SP0001', N'Nhà Giả Kim (Tái Bản 2020)', N'Paulo Coelho', N'NXB Hội Nhà Văn', 79000 , 15, 100, N'Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.', 'LSP01'),
	('SP0002', N'Cây Cam Ngọt Của Tôi', N'José Mauro de Vasconcelos', N'NXB Hội Nhà Văn', 108000, 15, 100, N'Mở đầu bằng những thanh âm trong sáng và kết thúc lắng lại trong những nốt trầm hoài niệm, Cây cam ngọt của tôi khiến ta nhận ra vẻ đẹp thực sự của cuộc sống đến từ những điều giản dị như bông hoa trắng của cái cây sau nhà, và rằng cuộc đời thật khốn khổ nếu thiếu đi lòng yêu thương và niềm trắc ẩn. Cuốn sách kinh điển này bởi thế không ngừng khiến trái tim người đọc khắp thế giới thổn thức, kể từ khi ra mắt lần đầu năm 1968 tại Brazil.', 'LSP01'),
	('SP0003', N'Tô Bình Yên Vẽ Hạnh Phúc', N'Kulzsc', N'NXB Phụ Nữ Việt Nam', 78000 , 18, 100, N'Không giống với những cuốn sách chỉ để đọc, “Tô bình yên – vẽ hạnh phúc”  là một cuốn sách mà độc giả vừa tìm được “Hạnh phúc to to từ những điều nho nhỏ” vừa được thực hành ngay lập tức. Một sự kết hợp mới lạ đầy thú vị giữa thể loại sách tản văn và sách tô màu.', 'LSP01'),
	('SP0004', N'Từ Điển Tiếng "Em" - Tái Bản 2021', N'Khotudien', N'NXB Phụ Nữ Việt Nam', 69000, 34, 100, N'Cuốn sách này giống như một chiếc hộp Pandora thú vị và hấp dẫn người đọc, vì bạn không thể đoán trước được tác giả sẽ “định nghĩa” câu nói đó theo nghĩa nào, cho ta thêm thích thú với những ngôn từ đáng yêu sử dụng mỗi ngày.', 'LSP01'),
	('SP0005', N'Your Name', N'Shinkai Makoto', N'NXB Hồng Đức', 75000, 21, 100, N'Mitsuha là nữ sinh trung học sống ở vùng quê hẻo lánh. Một ngày nọ, cô mơ thấy mình ở Tokyo trong một căn phòng xa lạ, biến thành con trai, gặp những người bạn chưa từng quen biết. Trong khi đó ở một nơi khác, Taki, một nam sinh trung học người Tokyo lại mơ thấy mình biến thành con gái, sống ở vùng quê hẻo lánh. Cuối cùng hai người họ nhận ra đang bị hoán đổi với nhau qua giấc mơ. Kể từ lúc hai con người xa lạ ấy gặp nhau, bánh xe số phận bắt đầu chuyển động.', 'LSP01'),
	('SP0006', N'Khu Vườn Ngôn Từ', N'Shinkai Makoto', N'IPM', 95000, 21, 100, N'Những ngày mưa triền miên... Nơi hàng hiên ngập tràn màu xanh của một khu vườn Nhật Bản... Có một cảm xúc êm dịu đến không thốt nên lời cứ thế manh nha, tựu hình và lửng lơ tồn tại. Trong lúc dòng đời cuồn cuộn chảy trôi, tất cả hối hả tiến về phía trước, thì cậu và cô lại dừng chân, chìm xuống trong tĩnh lặng riêng mình, và ở cái vũng tĩnh lặng đó, họ tìm thấy nhau. Dần dần và mạo hiểm, quên đi cả các chênh lệch về tuổi tác và vị trí, họ thả hồn mình trôi về nhau hòa điệu. Làm nền cho tất cả là mưa rơi không ngừng, là lá mướt mát rung rinh. Nhưng khi mưa tạnh và trời quang trở lại, mọi đường nét của hiện thực trở nên rõ rệt đến khắc nghiệt, thì những êm dịu và lửng lơ kia liệu còn khả năng tồn tại?', 'LSP01'),
	('SP0007', N'Dạy Con Làm Giàu - Tập 1 (Tái Bản 2018)', N'Robert T Kiyosaki', N'NXB Trẻ', 65000, 15, 100, N'Người giàu không làm việc vì tiền. Họ bắt tiền làm việc cho họ. Chấp nhận thất bại là bước đầu của thành công? Quyền lực của sự lựa chọn! Những bài học không có trong nhà trường. Hãy bắt đầu từ hôm nay “để không có tiền vẫn tạo ra tiền”….', 'LSP02'),
	('SP0008', N'Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', N'Napoleon Hill', N'NXB Tổng Hợp TPHCM', 110000, 20, 100, N'Think and Grow Rich - Nghĩ giàu và làm giàu là một trong những cuốn sách bán chạy nhất mọi thời đại. Đã hơn 60 triệu bản được phát hành với gần trăm ngôn ngữ trên toàn thế giới và được công nhận là cuốn sách tạo ra nhiều triệu phú, một cuốn sách truyền cảm hứng thành công nhiều hơn bất cứ cuốn sách kinh doanh nào trong lịch sử.', 'LSP02'),
	('SP0009', N'Vị Tu Sĩ Bán Chiếc Ferrari (Tái Bản Từ Cuốn Tìm Về Sức Mạnh Vô Biên) - Tái Bản 2020', N'Robin Sharma', N'NXB Tổng Hợp TPHCM', 98000, 20, 100, N'Vị Tu Sĩ Bán Chiếc Ferarri không phải là một cuốn sách xa lạ, cuốn sách này là một trong những ấn phẩm kinh điển của thế giới về đề tài truyền cảm hứng, theo đuổi lý tưởng sống, và hướng về một cuộc sống hạnh phúc. Đây cũng là cuốn sách đầu tiên mà tác giả, nhà diễn thuyết nổi tiếng thế giới Robin Sharma chấp bút.', 'LSP02'),
	('SP0010', N'Nhà Lãnh Đạo Không Chức Danh', N'Robin Sharma', N'NXB Trẻ', 80000, 11, 100, N'Suốt hơn 15 năm, Robin Sharma đã thầm lặng chia sẻ với những công ty trong danh sách Fortune 500 và nhiều người siêu giàu khác một công thức thành công đã giúp ông trở thành một trong những nhà cố vấn lãnh đạo được theo đuổi nhiều nhất thế giới. Đây là lần đầu tiên Sharma công bố công thức độc quyền này với bạn, để bạn có thể đạt được những gì tốt nhất, đồng thời giúp tổ chức của bạn có thể có những bước đột phá đến một cấp độ thành công mới trong thời đại thiên biến vạn hóa như hiện nay.', 'LSP02'),
	('SP0011', N'Nhà Đầu Tư Thông Minh (Tái Bản 2020)', N'Benjamin Graham', N'NXB Thế Giới', 199000, 15, 100, N'Là nhà tư vấn đầu tư vĩ đại nhất của thế kỷ 20, Benjamin Graham đã giảng dạy và truyền cảm hứng cho nhiều người trên khắp thế giới. Triết lý “đầu tư theo giá trị“ của Graham, bảo vệ nhà đầu tư khỏi những sai lầm lớn và dạy anh ta phát triển các chiến lược dài hạn, đã khiến Nhà đầu tư thông minh trở thành cẩm nang của thị trường chứng khoán kể từ lần xuất bản đầu tiên vào năm 1949. Trải qua năm tháng, diễn biến thị trường đã chứng minh tính sáng suốt trong các chiến lược của Graham. Trong khi vẫn giữ lại toàn vẹn văn bản ban đầu của Graham, ấn phẩm tái bản này bổ sung thêm bình luận cập nhật của ký giả chuyên về tài chính nổi tiếng Jason Zweig. Cái nhìn của Zweig bao quát hiện thực của thị trường ngày nay, vạch ra sự tương tự giữa những ví dụ của Graham và các tít báo về tài chính hiện nay, giúp bạn đọc có sự hiểu biết kỹ lưỡng hơn về cách thức áp dụng các nguyên tắc của Graham.', 'LSP02'),
	('SP0012', N'Dạy Con Làm Giàu 02 - Sử Dụng Đồng Vốn (Tái Bản 2020)', N'Robert T Kiyosaki, Sharon, L Lechter', N'NXB Trẻ', 120000, 30, 100, N'Bạn đang đi học? Bạn vừa ra trường và chưa có việc làm? Bạn đang làm việc với mức lương ổn định? Bạn đang làm cho một công ty tư nhân tư nhân? Bạn là một chủ doanh nghiệp nhỏ? Bạn muốn được thoải mái về tiền bạc ? “Dạy con làm giàu tập 2” sẽ là bước khởi đầu cho bạn - những quan điểm mới về đồng vốn và cách sử dụng tiền hiệu quả.', 'LSP02'),
	('SP0013', N'Đọc Vị Bất Kỳ Ai (Tái Bản 2019)', N'TS David J Lieberman', N'NXB Lao Động', 79000, 20, 100, N'Hãy chiếm thế thượng phong trong việc chủ động nhận biết điều cần tìm kiếm - ở bất kỳ ai bằng cách “thâm nhập vào suy nghĩ” của người khác. ĐỌC VỊ BẤT KỲ AI là cẩm nang dạy bạn cách thâm nhập vào tâm trí của người khác để biết điều người ta đang nghĩ. Cuốn sách này sẽ không giúp bạn rút ra các kết luận chung về một ai đó dựa vào cảm tính hay sự võ đoán. Những nguyên tắc được chia sẻ trong cuốn sách này không đơn thuần là những lý thuyết hay mẹo vặt chỉ đúng trong một số trường hợp hoặc với những đối tượng nhất định. Các kết quả nghiên cứu trong cuốn sách này được đưa ra dựa trên phương pháp S.N.A.P - cách thức phân tích và tìm hiểu tính cách một cách bài bản trong phạm vi cho phép mà không làm mếch lòng đối tượng được phân tích. Phương pháp này dựa trên những phân tích về tâm lý, chứ không chỉ đơn thuần dựa trên ngôn ngữ cử chỉ, trực giác hay võ đoán.', 'LSP03'),
	('SP0014', N'Khéo Ăn Nói Sẽ Có Được Thiên Hạ - Bản Mới', N'Trác Nhã', N'NXB Văn Học', 110000, 20, 100, N'Làm thế nào để ăn nói khéo léo? Có phương pháp và quy luật nào được áp dụng khi giao tiếp không? Có nguyên tắc và bí quyết nào cho các cuộc nói chuyện không? Trong những tình huống khác nhau, với những người khác nhau thì phải nói chuyện như thế nào, và làm sao để trình bày những điều khó nói? Cuốn sách “Khéo ăn nói sẽ có được thiên hạ” này sẽ giải đáp những câu hỏi đó. Cuốn sách với ngôn từ rõ ràng, gần gũi với cuộc sống sẽ mang đến những kĩ năng và phương pháp giao tiếp thực dụng, chắc chắn sẽ giúp ích cho quý độc giả. Nếu như những quy tắc và phương pháp chỉ giúp một số ít người nắm được và ứng dụng, thì giá trị của nĩ là có hạn. Chỉ cần những quy tắc và phương pháp cuốn sách đưa ra giúp được nhiều người, thì giá trị của nó là vơ hạn. Tác giả của “Khéo ăn nói sẽ có được thiên hạ” đã dốc hết tâm sức nghiên cứu về các kĩ năng và quy tắc giao tiếp, đây cũng chính là giá trị lớn nhất của cuốn sách.', 'LSP03'),
	('SP0015', N'Đại Dương Đen - Những Câu Chuyện Từ Thế Giới Của Trầm Cảm', N'Đặng Hoàng Giang', N'NXB Hội Nhà Văn', 240000, 13, 100, N'Đại dương đen là hành trình nhẫn nại của tác giả Đặng Hoàng Giang cùng người trầm cảm, kể cho chúng ta câu chuyện vừa dữ dội vừa tê tái về những số phận, mà vì định kiến và sự thiếu hiểu biết của chính gia đình và xã hội, đã bị tước đi quyền được sống với nhân phẩm, được cống hiến, được yêu thương và hạnh phúc.', 'LSP03'),
	('SP0016', N'Nghệ Thuật Tinh Tế Của Việc "Đếch" Quan Tâm', N'Mark Manson', N'Thanh Hương', 95000, 20, 100, N'"Cuốn này sẽ không dạy bạn cách để đạt tới điều này hay điều nọ, mà là làm thế nào để vứt bớt và buông bỏ... Nó sẽ hướng dẫn bạn cách nhắm mắt lại và tin rằng bạn có thể ngã ngửa ra đằng sau mà vẫn ổn. Nó sẽ dạy bạn: ĐỪNG CỐ” ', 'LSP03'),
	('SP0017', N'Trên Đường Băng (Tái Bản 2017)', N'Tony Buổi Sáng', N'NXB Trẻ', 80000, 15, 100, N'Trên Đường Băng của Tony Buổi Sáng tuy hướng đến những đọc giả là những người trẻ nhưng những người lớn hơn vẫn để hiểu hơn, và có cách nhìn nhận cũng như giáo dục con em mình tốt nhất thay vì bảo vệ con quá kĩ trở nên yếu ớt và thiếu tự lập. Và để yêu thương “khoa học” nhất. Đây cũng là cuốn sách mà những người đi làm nên sở hữu để nhìn lại chặng đường mình đã đi qua, suy ngẫm và thay đổi vì chưa bao giờ là quá muộn.', 'LSP03'),
	('SP0018', N'Homo Deus - Lược Sử Tương Lai', N'Yuval Noah Harari', N'NXB Thế Giới', 198000, 15, 100, N'Với giọng kể cuốn hút và mới lạ, Harari sẽ dần gợi mở và trả lời những câu hỏi trê, nhờ phân tích chi tiết những luận điểm gây nhiều tranh cãi: chủ nghĩa nhân đạo là một dạng tôn giáo, thứ tôn giáo tôn thờ con người thay vì thần thánh; sinh vật là thuật toán… ông vẽ ra một viễn cảnh tương lai khi Sapiens thất thế và Dữ liệu giáo trở thành một hình mẫu. HOMO DEUS còn bàn sâu hơn về các năng lực mà con người đã tự trang bị để sinh tồn và tiến hoá thành một giống loài ngự trị trên trái đất, để rồi chính trong tiến trình hoàn thiện và nâng cấp các năng lực ấy chúng ta sẽ bị truất quyền kiểm soát bởi một sinh vật mới, mang tên Homo Deus.', 'LSP04'),
	('SP0019', N'Nhật Ký Đặng Thùy Trâm (Tái Bản 2018)', N'Đặng Thuỳ Trâm', N'NXB Hội Nhà Văn', 76000, 20, 100, N'Một cuốn nhật kí nhặt được bên xác của một nữ Việt Cộng đã suýt bị người lính Mỹ ném vào lửa, nhưng người phiên dịch đã khuyên anh ta nên giữ lại vì "trong đó có lửa". Nhật kí Đặng Thùy Trâm là những ghi chép hàng ngày của một người nữ bác sĩ về cuộc sống của chị nơi chiến tuyến. Cuốn nhật kí là thế giới riêng của người trí thức nhạy cảm mà không yếu đuối, tha thiết với cuộc sống mà không hề sợ hãi trước những gian nan. Ở đó ta vẫn gặp những băn khoăn trăn trở trước tình yêu, trước cuộc sống phức tạp hàng ngày, những nỗi buồn, nỗi nhớ nhung, sự cô đơn của một người con gái, nhưng đồng thời chúng ta cũng thấy được một ý chí mãnh liệt, những lời nói tự động viên cảnh tỉnh, một lòng can đảm phi thường - những điều đã làm nên một thế hệ anh hùng.', 'LSP04'),
	('SP0020', N'Trump - Đừng Bao Giờ Bỏ Cuộc', N'Donald J.Trump & Meredith Mclver', N'NXB Trẻ', 65000, 10, 100, N'Trump - Đừng bao giờ bỏ cuộc, doanh nhân nổi tiếng nhất thế giới này thẳng thắn giãi bày những thách thức to lớn nhất, những giây phút tệ hại nhất, và những cuộc chiến khốc liệt nhất - và cách ông biến những nghịch cảnh đó thành các thành công mới. Cuốn sách còn đưa ra những lời khuyên đắt giá trong kinh về: cách phản pháo khi gặp thất bại và trở ngại; biến những vấn đề lớn thành những cơ hội thậm chí còn lớn hơn; cách biến kẻ thù và địch thủ thành bạn bè và đồng minh; cách tận dụng những thất bại trước mắt làm động lực cho bản thân bạn - và khiến bạn kiên cường hơn.', 'LSP04'),
	('SP0021', N'Cách Mạng Công Nghiệp Lần Thứ Tư', N'Klaus Schwab', N'NXB Chính Trị Quốc Gia Sự Thật', 129000, 20, 100, N'Cuốn sách Cách mạng công nghiệp lần thứ tư cung cấp những kiến thức cơ bản về cách mạng công nghiệp lần thứ tư - cách mạng công nghiệp lần thứ tư là gì, cuộc cách mạng này mang đến những gì, nó sẽ tác động đến chúng ta ra sao, và con người có thể làm gì để tranh thủ nó vì lợi ích chung. Cuốn sách Cách mạng công nghiệp lần thứ tư dành cho tất cả những ai quan tâm đến tương lai nhân loại và quyết tâm tranh thủ những cơ hội từ cuộc thay đổi mang tính cách mạng này để dựng xây một thế giới tốt đẹp hơn.', 'LSP04'),
	('SP0022', N'Thư Tình Gửi Một Người', N'Trịnh Công Sơn', N'NXB Trẻ', 180000, 11, 100, N'Tập sách gồm toàn bộ thư từ và hình ảnh liên quan mà nhạc sĩ Trịnh Công Sơn đã gửi cho Ngô Vũ Dao Ánh – người con gái đã là nhân vật trong nhiều khúc tình ca của nhạc sĩ từ năm 1964 đến năm 1989.', 'LSP04'),
	('SP0023', N'Nuôi Con Không Phải Là Cuộc Chiến', N'Bubu Hương, Mẹ Ong Bông, Hachun Lyonnet', N'NXB Lao Động', 99000, 20, 100, N'Nuôi con không phải là cuộc chiến: Cuốn sách không là cẩm nang để bé ăn nhiều tăng cân nhanh hay dạy bé nghe lời răm rắp, mà giúp bạn hiểu con mình hơn. Giúp bạn hiểu chu kỳ sinh học của con và cách phối kết hợp cuộc sống gia đình với chu kỳ sinh học đó của bé. Hơn thế, cuốn sách còn hướng dẫn bạn cách cho ăn khi con đói, các thông tin kinh nghiệm và các trường hợp thực tế áp dụng thành công của các “bà mẹ tuyệt vọng” khác giúp bạn có thông tin cũng như nghị lực thay đổi cách áp dụng nuôi và dạy con ở gia đình. Suy cho cùng, nuôi không hẳn đã khó, đến đoạn dạy con còn khó hơn nhiều. Cuối cùng đây là kinh nghiệm đặt những khuôn khổ hợp lý cho từng lứa tuổi, là bài học về tôn trọng trẻ thơ trong những khuôn khổ ấy. Nó sẽ làm cho kinh nghiệm làm mẹ của bạn ngọt ngào hơn và tránh cho con một tuổi thơ nước mắt bên bát cơm.', 'LSP05'),
	('SP0024', N'Cách Khen Cách Mắng Cách Phạt Con (Tái Bản 2021)', N'Masami Sasaki, Wakamatsu Aki', N'NXB Lao Động', 69000, 18, 100, N'Trong cuốn sách này, ngoài những cuộc trò chuyện trao đổi kinh nghiệm về cách nuôi dạy từ bác sĩ Masami Sasaki và cô Wakamatsu Aki, chúng tôi cũng thêm vào một vài đoạn giới thiệu khi còn nhỏ họ đã được cha mẹ giáo dục con như thế nào.', 'LSP05'),
	('SP0025', N'Phương Pháp Giáo Dục Con Của Người Do Thái', N'Trần Hân, Thanh Nhã', N'Hồng Bàng', 62000, 18, 100, N'Người Do Thái là dân tộc thông minh nhất thế giới, họ dường như được sinh ra là để làm chủ thế giới này". Dù không phải là một chủng tộc lớn, đất nước Do Thái chỉ có hơn 7 triệu dân nhưng không một nhóm chủng tộc nào có thể sánh được với người Do Thái về khả năng và thành tích vượt trội. Góp phần làm biến động lịch sử nhân loại thế kỉ XX, phải kể đến nhà khoa học vĩ đại Albert Einstein, bộ óc của thế kỉ Sigmund Freud, họa sĩ theo trường phái lập thể Picasso, người sáng tạo ra chủ nghĩa Cộng sản Karl Marx hay những người giàu nhất thế giới như Bill Gates, Warren Bufett, Micheal Dell... Nói về người Do Thái thì ai trong chúng ta cũng đều trầm trồ ngưỡng mộ và khâm phục. Có bao giờ bạn tự hỏi tại sao họ lại có trí tuệ phi thường như vậy? Tại sao họ lại được sinh ra với quá nhiều ưu việt như thế? Có phải tất cả đều là tự nhiên? Liệu Việt Nam chúng ta có thể tạo ra những thế hệ ưu việt như thế không? Tất cả câu hỏi trên đều có thể được giải đáp bởi chính các bạn và cuốn sách bạn đang cầm trên tay. Hi vọng các bậc cha mẹ có thể lĩnh ngộ được quan niệm giáo dục con cái người Do Thái. Học tập và vận dụng kinh nghiệm giáo dục của họ là món quà tuyệt vời giúp con bạn thành công trong tương lai.', 'LSP05'),
	('SP0026', N'Làm Cha Mẹ Tỉnh Thức', N'Tiến sĩ Shefali Tsabary', N'NXB Lao Động', 139000, 20, 100, N'Làm cha mẹ tỉnh thức được viết ra với mong muốn độc giả, những người ngày ngày vật lộn với thiên chức làm cha mẹ - đặc biệt là những bậc phụ huynh đang có con ở tuổi vị thành niên, tìm thấy phao cứu sinh của mình.', 'LSP05'),
	('SP0027', N'Để Con Được Ốm - Tái Bản 2018', N'Uyên Bùi, BS Trí Đoàn', N'NXB Thế Giới', 95000, 20, 100, N'Để con được ốm có thể coi là một cuốn nhật ký học làm mẹ thông qua những câu chuyện từ trải nghiệm thực tế mà chị Uyên Bùi đã trải qua từ khi mang thai đến khi em bé chào đời và trở thành một cô bé khỏe mạnh, vui vẻ. Cùng với những câu chuyện nhỏ thú vị của người mẹ là lời khuyên mang tính chuyên môn, giải đáp cụ thể từ bác sỹ Nguyễn Trí Đoàn, giúp hóa giải những hiểu lầm từ kinh nghiệm dân gian được truyền lại, cũng như lý giải một cách khoa học những thông tin chưa đúng đắn đang được lưu truyền hiện nay, mang đến góc nhìn đúng đắn nhất cho mỗi hiện tượng, sự việc với những kiến thức y khoa hiện đại được cập nhật liên tục. Cuốn sách sẽ giúp các bậc phụ huynh trang bị một số kiến thức cơ bản trong việc chăm sóc trẻ một cách khoa học và góp phần giúp các mẹ và những-người-sẽ-là-mẹ trở nên tự tin hơn trong việc chăm con, xua tan đi những lo lắng, để mỗi em bé ra đời đều được hưởng sự chăm sóc tốt nhất.', 'LSP05'),
	('SP0028', N'Bé Tập Đọc Và Tô Chữ Cái - Hành Trang Cho Bé Vào Lớp 1', N'Vân Hương', N'NXB Mỹ Thuật', 10000, 20, 100, N'Hành Trang Cho Bé Vào Lớp 1 - Bé Tập Đọc Và Tô Chữ Cái được biên soạn theo chương trình Giáo dục mầm non được Bộ Giáo dục và Đào tạo ban hành. Nội dung sách được biên soạn nhằm mục đích trang bị một số kỹ năng cơ bản cho các em học sinh mẫu giáo và chuẩn bị vào lớp một.', 'LSP06'),
	('SP0029', N'Tập Tô Chữ Số Dành Cho Trẻ Từ 4-5 Tuổi - Quyển 1', N'Trần Ngọc Bảo Hân', N'NXB Đồng Nai', 20000, 18, 100, N'Cuốn sách Vở Tập Tô Chữ Số (Dành Cho Trẻ 4 - 5 Tuổi) gồm các bài tập viết các số từ 1 đến 10. Mỗi mẫu chữ đều có hướng dẫn từng nét cụ thể giúp bé dễ dàng tập viết.', 'LSP06'),
	('SP0030', N'Luyện Nét Chữ Rèn Nết Người - Vở Ô Li Có Mẫu Chữ - Lớp 1 - Quyển 2 (Tái Bản 2020)', N'Dương Linh', N'NXB Mỹ Thuật', 20000, 20, 100, N'Bộ sách Luyện nét chữ rèn nết người hướng dẫn các em viết chữ đẹp.', 'LSP06'),
	('SP0031', N'Tập Tô Và Làm Quen Với Chữ Số', N'Nguyễn Thị Hương Giang', N'NXB Đại Học Sư Phạm', 12500, 5, 100, N'Sách có nội dung phong phú với nhiều bài tập đa dạng theo hình thức trò chơi, phù hợp với các em trong độ tuổi 5 - 6 tuổi. Ngoài ra, sách còn kèm theo hình vẽ minh họa màu sinh động, giúp các em hứng thú hơn trong học tập.', 'LSP06'),
	('SP0032', N'Vở Ô Ly Tập Tô Chữ Số (Dành Cho Bé Chuẩn Bị Vào Lớp 1)', N'Chính An', N'NXB Thanh Hóa', 12000, 0, 100, N'Luyện chữ đẹp, rèn tính nết.', 'LSP06'),
	('SP0033', N'Sách Giáo Khoa Bộ Lớp 3 - Bài Học + Bài Tập (Bộ 13 Cuốn) (2021)', N'Bộ Giáo Dục Và Đào Tạo', N'NXB Giáo Dục Việt Nam', 115100, 0, 100, N'Sách Giáo Khoa Bộ Lớp 3 - Bài Học + Bài Tập (Bộ 13 Cuốn) (2021)', 'LSP07'),
	('SP0034', N'Bộ Sách Giáo Khoa Lớp 1 - Sách Bài Học - Bộ Sách Chân Trời Sáng Tạo (Bộ 9 Cuốn) (2021)', N'Nhiều Tác Giả', N'NXB Đại Học Sư Phạm TPHCM', 186000, 0, 100, N'Bộ Sách Giáo Khoa Lớp 1 - Sách Bài Học - Bộ Sách Chân Trời Sáng Tạo (Bộ 9 Cuốn) (2021)', 'LSP07'),
	('SP0035', N'Sách Giáo Khoa Bộ Lớp 6 - Sách Bài Học - Bộ Sách Chân Trời Sáng Tạo (Bộ 12 Cuốn) (2021)', N'Bộ Giáo Dục Và Đào Tạo', N'NXB Giáo Dục Việt Nam', 234000, 0, 100, N'Sách Giáo Khoa Bộ Lớp 6 - Sách Bài Học - Bộ Sách Chân Trời Sáng Tạo (Bộ 12 Cuốn) (2021)', 'LSP07'),
	('SP0036', N'Sách Giáo Khoa Bộ Lớp 8 - Sách Bài Học (Bộ 13 Cuốn) (2021)', N'Bộ Giáo Dục Và Đào Tạo', N'NXB Giáo Dục Việt Nam', 149000, 0, 100, N'Sách Giáo Khoa Bộ Lớp 8 - Sách Bài Học (Bộ 13 Cuốn) (2021)', 'LSP07'),
	('SP0037', N'Sách Giáo Khoa Bộ Lớp 9 - Sách Bài Học (Bộ 11 Cuốn - Không Tiếng Anh) (2021)', N'Bộ Giáo Dục Và Đào Tạo', N'NXB Giáo Dục Việt Nam', 127000, 0, 100, N'Sách Giáo Khoa Bộ Lớp 9 - Sách Bài Học (Bộ 11 Cuốn - Không Tiếng Anh) (2021)', 'LSP07'),
	('SP0038', N'Tự Học 2000 Từ Vựng Tiếng Anh Theo Chủ Đề (Tái Bản)', N'The Windy', N'NXB Đại Học Quốc Gia Hà Nội', 52000, 20, 100, N'Nhà ngôn ngữ học nổi tiếng D.A.Wilkins đã nói rằng “Without grammar, very little can be conveyed; without vocabulary, nothing can be conveyed.” (Không có ngữ pháp, rất ít thông tin có thể được truyền đạt; Không có từ vựng, không một thông tin nào có thể được truyền đạt cả). Vì thế, trong việc học một ngoại ngữ, thì từ vựng có thể xem như các tế bào nhỏ hình thành nên khả năng sử dụng ngoại ngữ của người học.', 'LSP08'),
	('SP0039', N'Cambridge Ielts 11 Academic With Answers (Savina)', N'NXB Cambridge University', N'NXB Cambridge University', 150000, 5, 100, N'Cambridge Ielts 11 Academic With Answers (Savina)', 'LSP08'),
	('SP0040', N'Tiếng Nhật Cho Mọi Người - Sơ Cấp 2 - Bản Dịch Và Giải Thích Ngữ Pháp - Tiếng Việt (Bản Mới)', N'Minna no Nihongo', N'NXB Trẻ', 70000, 15, 100, N'Tiếng Nhật Cho Mọi Người - Sơ Cấp 2 - Bản Dịch Và Giải Thích Ngữ Pháp - Tiếng Việt (Bản Mới)', 'LSP08'),
	('SP0041', N'25 Chuyên Đề Ngữ Pháp Tiếng Anh Trọng Tâm - Tập 1', N'Trang Anh', N'NXB Đại Học Sư Phạm', 110000, 80, 100, N'Các chuyên đề ngữ pháp trọng tâm được trình bày đơn giản, dễ hiểu cùng với hệ thống bài tập và từ vựng phong phú. Có tất cả 25 chuyên đề trong 2 tập sách, là tài liệu hữu ích cho học sinh, sinh viên, người đi làm, luyện thi cho các kỳ thi quốc gia, ôn luyện các chứng chỉ quốc tế và là tài liệu tham khảo cho giáo viên.', 'LSP08'),
	('SP0042', N'Giải Thích Ngữ Pháp Tiếng Anh (Bài Tập & Đáp Án) (Tái Bản 2019)', N'Mai Lan Hương, Hà Thanh Uyên', N'NXB Đà Nẵng', 220000, 20, 100, N'SáchGiải Thích Ngữ Pháp Tiếng Anhvới bài tập và đáp ánđược biên soạn thành 9 chương, đề cập đến những vấn đề ngữ pháp từ cơ bản đến nâng cao. Nội dung các chương được biên soạn dựa trên ngữ pháp tiếng Anh hiện đại, giải thích cặn kẽ, rõ ràng các cách dùng và quy luật mà người học cần nắm vững:đồng thời chỉ ra những quy luật khác nhau giữa tiếng anh của người Anh (British English) và tiếng Anh của người Mỹ (American English).Cuối mỗi phần ngữ pháp đều có bài tập đa dạng để giúp người học nắm vững phần lý thuyết. Hơn nữa, hiện nay hình thức thi trắc nghiệm đang được áp dụngtrong các kỳ thi, nên trong sách này chúng tôi biên soạn một số phần bài tập trắc nghiệm để đáp ứng nhu cầu của người học trong tình hình mới.', 'LSP08'),
	('SP0043', N'Song of Achilles', N'Madeline Miller', N'Bloomsbury UK', 210000, 0, 100, N'Greece in the age of heroes. Patroclus, an awkward young prince, has been exiled to the court of King Peleus and his perfect son Achilles. Despite their differences, Achilles befriends the shamed prince, and as they grow into young men skilled in the arts of war and medicine, their bond blossoms into something deeper - despite the displeasure of Achilles''s mother Thetis, a cruel sea goddess. But when word comes that Helen of Sparta has been kidnapped, Achilles must go to war in distant Troy and fulfill his destiny. Torn between love and fear for his friend, Patroclus goes with him, little knowing that the years that follow will test everything they hold dear.', 'LSP09'),
	('SP0044', N'Five People You Meet in Heaven', N'Mitch Albom', N'Hachette', 178000, 10, 100, N'Eddie is a wounded war veteran, an old man who has lived, in his mind, an uninspired life. His job is fixing rides at a seaside amusement park.', 'LSP09'),
	('SP0045', N'Find Me: A Novel', N'André Aciman', N'Picador', 290000, 10, 100, N'In this spellbinding exploration of the varieties of love, the author of the worldwide bestseller Call Me by Your Name revisits its complex and beguiling characters decades after their first meeting.', 'LSP09'),
	('SP0046', N'Circe', N'Madeline Miller', N'Bloomsbury Publishing', 139000, 10, 100, N'The captivating Sunday Times and New York Times number one bestseller by the Orange Prize-winning author of The Song of Achilles; ''spellbinding ... a thrilling tour de force of the imagination'' (Mail on Sunday)', 'LSP09'),
	('SP0047', N'Normal People: A Novel', N'Sally Rooney', N'Hogarth', 336000, 10, 100, N'Connell and Marianne grew up in the same small town, but the similarities end there. At school, Connell is popular and well liked, while Marianne is a loner. But when the two strike up a conversation—awkward but electrifying—something life changing begins.', 'LSP09'),
	('SP0048', N'Creativity, Inc. : Overcoming the Unseen Forces That Stand in the Way of True Inspiration', N'Ed Catmull', N'Transworld Publishers Ltd', 305000, 10, 100, N'As a young man, Ed Catmull had a dream: to make the world''s first computer-animated movie. He nurtured that dream first as a Ph.D. student at the University of Utah, where many computer science pioneers got their start, and then forged an early partnership with George Lucas that led, indirectly, to his founding Pixar with Steve Jobs and John Lasseter in 1986. Nine years later and against all odds, Toy Story was released, changing animation forever.', 'LSP10'),
	('SP0049', N'Zero to One : Notes on Start Ups, or How to Build the Future', N'Peter Thiel,Blake Masters', N'Ebury Publishing', 195000, 10, 100, N'What valuable company is nobody building? The next Bill Gates will not build an operating system. The next Larry Page or Sergey Brin won''t make a search engine. If you are copying these guys, you aren''t learning from them. It''s easier to copy a model than to make something new: doing what we already know how to do takes the world from 1 to n, adding more of something familiar. Every new creation goes from 0 to 1.', 'LSP10'),
	('SP0050', N'The Tipping Point: How Little Things Can Make a Big Difference', N'Malcolm Gladwell', N'Little Brown and Company', 174000, 10, 100, N'In this brilliant and original book, Malcolm Gladwell explains and analyses the ''tipping point'', that magic moment when ideas, trends and social behaviour cross a threshold, tip and spread like wildfire. Taking a look behind the surface of many familiar occurrences in our everyday world, Gladwell explains the fascinating social dynamics that cause rapid change.', 'LSP10'),
	('SP0051', N'Bad Blood: Secrets And Lies In A Silicon Valley Startup', N'John Caeeeyou', N'Penguin Random House', 138000, 10, 100, N'In 2014, Theranos founder and CEO Elizabeth Holmes was widely seen as the next Steve Jobs: a brilliant Stanford dropout whose startup "unicorn" promised to revolutionize the medical industry with its breakthrough device, which performed the whole range of laboratory tests from a single drop of blood. Backed by investors such as Larry Ellison and Tim Draper, Theranos sold shares in a fundraising round that valued the company at more than $9 billion, putting Holmes''s worth at an estimated $4.5 billion. There was just one problem: The technology didn''t work. Erroneous results put patients in danger, leading to misdiagnoses and unnecessary treatments. All the while, Holmes and her partner, Sunny Balwani, worked to silence anyone who voiced misgivings--from journalists to their own employees.', 'LSP10'),
	('SP0052', N'No Rules Rules : Netflix And The Culture Of Reinvention', N'REED HASTINGS, Erin Meyer', N'Ebury Publishing', 338000, 10, 100, N'From unlimited holidays to abolishing approvals, Netflix offers a fundamentally different way to run any organisation, one far more in tune with an ever-changing fast-paced world. For anyone interested in creativity, productivity and innovation, the Netflix culture is something close to a holy grail. This book will make it, and its creator, fully accessible for the first time.', 'LSP10'),
	('SP0053', N'Atomic Habits', N'James Clear', N'Avery Publishing Group', 34000, 15, 100, N'No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world''s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.', 'LSP11'),
	('SP0054', N'The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life', N'Mark Manson', N'HarperOne', 248000, 10, 100, N'In this generation-defining self-help guide, a superstar blogger cuts through the crap to show us how to stop trying to be "positive" all the time so that we can truly become better, happier people.', 'LSP11'),
	('SP0055', N'Rich Dad Poor Dad', N'Robert T. Kiyosaki', N'Plata Publishing', 165000, 0, 100, N'Rich Dad Poor Dad is Robert''s story of growing up with two dads — his real father and the father of his best friend, his rich dad — and the ways in which both men shaped his thoughts about money and investing. The book explodes the myth that you need to earn a high income to be rich and explains the difference between working for money and having your money work for you.', 'LSP11'),
	('SP0056', N'The Power Of Habit', N'Charles Duhigg', N'Random House Books', 203000, 10, 100, N'We can always change. In The Power of Habit, award-winning New York Times business reporter Charles Duhigg translates cutting-edge behavioural science into practical self-improvement action, distilling advanced neuroscience into fascinating narratives of transformation.', 'LSP11'),
	('SP0057', N'Barking Up The Wrong Tree: The Surprising Science Behind Why Everything You Know About Success Is (Mostly) Wrong', N'Eric Barker', N'HarperCollins US', 126000, 10, 100, N'Barking Up The Wrong Tree: The Surprising Science Behind Why Everything You Know About Success Is (Mostly) Wrong', 'LSP11'),
	('SP0058', N'Women Who Run with the Wolves: Contacting the Power of the Wild Woman', N'Clarissa Pinkola Estes', N'Rider & Co', 273000, 8, 100, N'"Women Who Run With The Wolves" isn''t just another book. It is a gift of profound insight, wisdom and love. An oracle from one who knows.'' - Alice Walker. In the classic "Women Who Run With The Wolves", Clarissa Pinkola Estes tells us about the ''wild woman'', the wise and ageless presence in the female psyche that gives women their creativity, energy and power. For centuries, the ''wild woman'' has been repressed by a male-orientated value system which trivialises women''s emotions.', 'LSP11'),
	('SP0059', N'Harry Potter And The Half-Blood Prince - Slytherin Edition', N'J.K. Rowling', N'Bloomsbury', 256000, 15, 100, N'This Slytherin House Edition of Harry Potter and the Half-Blood Prince celebrates the noble character of the Hogwarts house famed for its pride, ambition and cunning. Harry''s sixth year at Hogwarts is packed with more great Slytherin moments and characters – not least Professor Slughorn''s return to Hogwarts and the unveiling of Tom Riddle''s past.', 'LSP12'),
	('SP0060', N'The Very Hungry Caterpillar', N'Eric Carle', N'Penguin Group US', 68000, 10, 100, N'Eric Carle''s classic story begins one sunny Sunday, when the caterpillar was hatched out of a tiny egg. He was very hungry. On Monday, he ate through one apple; on Tuesday, he ate through three plums--and still he was hungry. Strikingly bold, colorful pictures and a simple text in large, clear type tell the story of a hungry little caterpillar''s progress through an amazing variety and quantity of foods.', 'LSP12'),
	('SP0061', N'Harry Potter and the Philosopher''s Stone Gryffindor Edition - Paperback', N'J.K. Rowling', N'Bloomsbury Childrens', 189000, 10, 100, N'Celebrate 20 years of Harry Potter magic with four special editions of Harry Potter and the Philosopher''s Stone.', 'LSP12'),
	('SP0062', N'Harry Potter And The Half-Blood Prince - Gryffindor Edition', N'J.K. Rowling', N'Bloomsbury', 256000, 15, 100, N'This Gryffindor House Edition of Harry Potter and the Half-Blood Prince celebrates the noble character of the Hogwarts house famed for its courage, bravery and determination. Harry''s sixth year at Hogwarts is packed with more great Gryffindor moments and characters – not least Dumbledore''s quest to find and destroy Lord Voldemort''s Horcruxes.', 'LSP12'),
	('SP0063', N'Lift-the-flap Very First Questions and Answers What is poo?', N'Katie Daynes', N'Usborne Publishing Ltd', 170000, 10, 100, N'What is poo? Does everyone do it? And where does it all go? Children can lift the flaps to find the answers in this surprisingly charming book, and discover how much poo an elephant does, and what you can do with poo... There''s even a Who did these poos? quiz. A very informative little book!', 'LSP12'),
	('SP0064', N'Harry Potter and the Philosopher''s Stone Hufflepuff Edition - Pa', N'J.K. Rowling', N'Bloomsbury Childrens', 189000, 10, 100, N'PHÁT HÀNH CÙNG LÚC THẾ GIỚI 1/6/2017. Tham khảo thêm thông tin chính thức từ NXB http://www.harrypotter.bloomsbury.com/uk/harrypotter20/', 'LSP12'),
	('SP0065', N'Family And Friends Special Edition 4 - Student Book - Sách Không CD Kèm Thẻ Cào', N'Naomi Simmons', N'Oxford University Press', 95000, 0, 100, N'Family And Friends Special Edition 4 - Student Book - Sách Không CD Kèm Thẻ Cào', 'LSP13'),
	('SP0066', N'Access Grade 7 Student''s Book w EC', N'', N'', 204000, 0, 100, N'', 'LSP13'),
	('SP0067', N'Access Grade 7 Workbook', N'', N'', 107000, 0, 100, N'', 'LSP13'),
	('SP0068', N'English Grammar in Use Book w Ans', N'Raymond Murphy', N'Cambridge University', 178000, 5, 100, N'The world''s best-selling grammar series for learners of English. English Grammar in Use Fourth edition is an updated version of the world''s best-selling grammar title. It has a fresh, appealing new design and clear layout, with revised and updated examples, but retains all the key features of clarity and accessibility that have made the book popular with millions of learners and teachers around the world. This ''with answers'' version is ideal for self-study. An online version, book without answers, and book with answers and CD-ROM are available separately.', 'LSP13'),
	('SP0069', N'Family And Friends Special Edition 3 - Student Book - Sách Không CD Kèm Thẻ Cào', N'Oxford', N'Phát triển Giáo dục Phương Nam', 95000, 0, 100, N'Family And Friends Special Edition 3 - Student Book - Sách Không CD Kèm Thẻ Cào', 'LSP13'),
	('SP0070', N'Ba Lô Chống Gù Bé Trai Bebé Web Slinger - Màu Xanh - Đỏ - BB08MCS-305BE', N'Việt Nam', N'Việt Nam', 760000, 0, 100, N'Sản phẩm balo học sinh của nhãn hiệu Bebé được sản xuất tại Việt Nam, balo có sử dụng hình ảnh nhân vật của Walt Disney/ Marvel.', 'LSP14'),
	('SP0071', N'Bao Tập Sinh Viên Nylon PĐ 255 (10Tờ/Cuộn)', N'Việt Nam', N'Việt Nam', 15000, 0, 100, N'Bao Tập Sinh Viên Nylon PĐ 255 (10Tờ/Cuộn)được làm từ nylon bền đẹp, dẻo dai dành cho sinh viên giúp sách vở luôn luôn sạch đẹp.', 'LSP14'),
	('SP0072', N'Thước Kẻ EZMath 15 cm Campus RL-EZM-PS15-1', N'Thương Hiệu Nhật', N'Trung Quốc', 5500, 10, 100, N'Là loại thước thẳng dùng cho học sinh, chiều dài 15cm.', 'LSP14'),
	('SP0073', N'Bóp Viết Vải Tiger Square Easy - Lovely Skate - BB06TMF-017LM', N'Thương Hiệu Hong Kong', N'Trung Quốc', 80000, 0, 100, N'Bóp Viết Vải Tiger được may từ vải polyester bền đẹp, dày chắc, tạo sự mềm mại và tăng thêm tính thẩm mỹ cho sản phẩm. Chất liệu vải mềm nhẹ, dễ vệ sinh, thuận tiện cho việc sử dụng và bảo quản. Khung sản phẩm bằng nhựa bền chắc, tạo forrm dáng tốt cho hộp đựng. Hộp bút có đường may tỉ mỉ và chắc chắn, hạn chế tình trạng bung, rách chỉ khi sử dụng lâu.', 'LSP14'),
	('SP0074', N'Bóp Viết Vải Tiger Square Easy - Flying Hearts - TGJY-006B1', N'Thương Hiệu Hong Kong', N'Trung Quốc', 80000, 0, 100, N'Bóp Viết Vải Tiger được may từ vải polyester bền đẹp, dày chắc, tạo sự mềm mại và tăng thêm tính thẩm mỹ cho sản phẩm. Chất liệu vải mềm nhẹ, dễ vệ sinh, thuận tiện cho việc sử dụng và bảo quản. Khung sản phẩm bằng nhựa bền chắc, tạo forrm dáng tốt cho hộp đựng. Hộp bút có đường may tỉ mỉ và chắc chắn, hạn chế tình trạng bung, rách chỉ khi sử dụng lâu.', 'LSP14'),
	('SP0075', N'File Tài Liệu Đứng Campus DF-5Y-U2 - Màu Vàng', N'Thương Hiệu Nhật', N'Trung Quốc', 48500, 10, 100, N'Là vật dụng thiết yếu và quan trọng, giúp bảo quản và sắp xếp hồ sơ gọn gàng, ngăn nắp, tránh bị nhàu nát.', 'LSP15'),
	('SP0076', N'Bấm Kim Số 10 Elephant No.10 EVO110239', N'Thương Hiệu Thái Lan', N'Thái Lan', 35000, 0, 100, N'Trong văn phòng, bấm kim số 10 là vật dụng không thể thiếu khi bạn muốn liên kết, kẹp các tờ giấy tài liệu quan trọng lại với nhau và bảo quản một cách ngăn nắp. Bấm kim số 10 thông thường có thể bấm từ 10~20 tờ, còn tùy loại kim 10. Đặc biệt Bấm kim Elephant NO.10 EVO sử dụng bấm được đến 32 tờ giấy A4 định lượng 70gsm.', 'LSP15'),
	('SP0077', N'Bìa Còng Elephant 2101F 5.2 cm - Xanh Nõn Chuối', N'Thương Hiệu Thái Lan', N'Thái Lan', 60000, 0, 100, N'Bìa Còng Elephant 2101F 5.2 cm - Xanh Nõn Chuối', 'LSP15'),
	('SP0078', N'Bìa Nút - Thiết Kế Paris DoubleA EV03313-EN - Xanh Dương', N'Thương Hiệu Hàn Quốc', N'Trung Quốc', 25500, 0, 100, N'Được sản xuất từ chất liệu PP độ bền cao, tiện dụng cho nhân viên văn phòng và học sinh, sinh viên để bảo quản tài liệu của mình.', 'LSP15'),
	('SP0079', N'Ống Đựng Bút Tròn HY6341 - Màu Bạc', N'Thương Hiệu Thái Lan', N'Trung Quốc', 42000, 0, 100, N'Cắm Viết được làm từ kim loại cao cấp, không chứa các chất độc hại, thân thiện với môi trường, độ bền lâu dài theo thời gian sử dụng.', 'LSP15'),
	('SP0080', N'Vở Vẽ Crabit 40 Trang A4 1951', N'Việt Nam', N'Việt Nam', 15500, 0, 100, N'Vở Vẽ Crabit 40 Trang A4 1951', 'LSP16'),
	('SP0081', N'Bộ Màu Vẽ Masterart Series 48 Màu', N'Thương Hiệu Thái Lan', N'Trung Quốc', 256000, 0, 100, N'Ruột bút được làm từ công thức riêng của Master Art có chất lượng cao. Màu sắc tươi sáng, tô êm và không bụi, ruột chì đường kính 3.3 mm. Được làm từ gỗ chất lượng cao giúp bút luôn thẳng, gọt bút dễ dàng không bị gãy', 'LSP16'),
	('SP0082', N'Bộ Màu Vẽ Masterart Series 12 Màu', N'Thương Hiệu Thái Lan', N'Trung Quốc', 62000, 0, 100, N'Ruột bút được làm từ công thức riêng của Master Art có chất lượng cao. Màu sắc tươi sáng, tô êm và không bụi, ruột chì đường kính 3.3 mm. Được làm từ gỗ chất lượng cao giúp bút luôn thẳng, gọt bút dễ dàng không bị gãy', 'LSP16'),
	('SP0083', N'Tập Vẽ A4 10 Trang ĐL 100g/m2 Masterart D-401 (Mẫu Sản Phẩm Giao Ngẫu Nhiên)', N'Thương Hiệu Thái Lan', N'', 21500, 0, 100, N'Chất liệu giấy vẽ cao cấp, chất lượng có độ trắng cao, bề mặt mềm mượt đạt chuẩn đảm bảo không bị nhàu nát, rách trong quá trình sử dụng. Đồng thời, sản phẩm có thể phù hợp với với nhiều loại bút như bút chì các loại, bút crayon,... và các loại màu như màu nước, màu sáp…', 'LSP16'),
	('SP0084', N'Tuýp Màu Poster Paint 12ml PRIMO 440TRA310 - Carmine', N'Thương Hiệu Ý', N'Ý', 13000, 0, 100, N'Màu sơn áp phích chất lượng cao. Sử dụng dễ dàng. Có thể sử dụng trên các bề mặt khác nhau như giấy, bìa cứng, gỗ, thủy tinh, kim loại, đất nung và nhựa.', 'LSP16'),
	('SP0085', N'Mouse Bitis Làm Hoa - Màu Vàng', N'Trung Quốc', N'Trung Quốc', 13000, 0, 100, N'Giấy xốp màu dùng để cắt. dán. Trang trí mọi nơi theo sở thích. Xốp mềm. Dẻo. Nhiều màu. Dùng được nhiều lần. An toàn. Không độc hại.', 'LSP17'),
	('SP0086', N'Giấy Sợi Size S G005S - Màu Cam', N'Việt Nam', N'Việt Nam', 3500, 0, 100, N'Sản phẩm góp phần tô điểm cho món quà của bạn trở nên sinh động và bắt mắt hơn. Sản phẩm không chỉ là vật trang trí mà còn góp phần chống sốc hiệu quả đối với các sản phẩm dễ vỡ. Sản phẩm được làm từ chất liệu giấy cao cấp, không độc hại, chất lượng tốt, an toàn cho sức khỏe.', 'LSP17'),
	('SP0087', N'Túi Giấy Kraft Họa Tiết 25x22 - Mẫu 3', N'Việt Nam', N'Việt Nam', 10000, 0, 100, N'Sản phẩm được sử dụng phổ biến để đựng hàng hóa, quà tặng, phụ kiện, linh kiện, trang sức, những sản phẩm nhỏ, dễ thất lạc.', 'LSP17'),
	('SP0088', N'Hộp Thiết Đựng Tiền S-247 - Màu Hồng', N'Trung Quốc', N'Trung Quốc', 71000, 0, 100, N'Hộp Thiếc Đựng Tiền S-247 sẽ là cách giữ tiền tiết kiệm mới, là người bạn đặc biệt được yêu thích của các em nhỏ từ bé.', 'LSP17'),
	('SP0089', N'Vòng Hoa Trang Trí Giáng Sinh', N'Trung Quốc', N'Trung Quốc', 72000, 0, 100, N'Vòng hoa hay còn được gọi là kiểu vòng nguyệt quế, là một trong những món đồ không thể thiếu đế có một mùa noel thật trọn vẹn.', 'LSP17')

CREATE TABLE ANHSANPHAM (
	Id int identity not null,
	IdSanPham varchar(10) not null,
	TenHinhAnh varchar(max) not null,
	del_flag bit default(1),

	primary key (Id),
	constraint fk_hinhanh_sanpham
	foreign key (IdSanPham)
	references SANPHAM(Id)
)

INSERT INTO ANHSANPHAM 
	(IdSanPham, TenHinhAnh)
VALUES
	('SP0001', 'nha-gia-kim.jpg'),
	('SP0002', 'cay-cam-ngot-cua-toi.jpg'),
	('SP0003', 'to-binh-yen-ve-hanh-phuc.jpg'),
	('SP0004', 'tu-dien-tieng-em.jpg'),
	('SP0005', 'your-name.jpg'),
	('SP0006', 'khu-vuon-ngon-tu.jpg'),
	('SP0007', 'day-con-lam-giau.jpg'),
	('SP0008', 'nghi-giau-lam-giau.jpg'),
	('SP0009', 'vi-tu-si-ban-chiec-ferrari.jpg'),
	('SP0010', 'nha-lanh-dao-khong-chuc-danh.jpg'),
	('SP0011', 'nha-dau-tu-thong-minh.jpg'),
	('SP0012', 'day-con-lam-giau-2.jpg'),
	('SP0013', 'doc-vi-bat-ki-ai.jpg'),
	('SP0014', 'kheo-an-kheo-noi-se-co-duoc-thien-ha.jpg'),
	('SP0015', 'dai-duong-den.jpg'),
	('SP0016', 'nghe-thuat-tinh-te-cau-viec-dech-quan-tam.jpg'),
	('SP0017', 'tren-duong-bang.jpg'),
	('SP0018', 'luoc-su-tuong-lai.jpg'),
	('SP0019', 'nhat-ky-dang-thuy-tram.jpg'),
	('SP0020', 'trump-dung-bao-gio-bo-cuoc.jpg'),
	('SP0021', 'cach-mang-cong-nghiep-lan-thu-tu.jpg'),
	('SP0022', 'thu-tinh-gui-mot-nguoi.jpg'),
	('SP0023', 'nuoi-con-khong-phai-cuoc-chien.jpg'),
	('SP0024', 'cach-khen-cach-che-cach-phat-con.jpg'),
	('SP0025', 'phuong-phap-giao-duc-con-cua-nguoi-do-thai-sach.jpg'),
	('SP0026', 'lam-cha-me-tinh-thuc.jpg'),
	('SP0027', 'de-con-duoc-om.jpg'),
	('SP0028', 'be-tap-doc-chu-va-so.jpg'),
	('SP0029', 'be-tap-to-chu-so-danh-cho-be-4-5-tuoi.jpg'),
	('SP0030', 'luyen-net-chu-ren-net-nguoi.jpg'),
	('SP0031', 'be-tap-to-va-lam-quen-voi-chu-so.jpg'),
	('SP0032', 'vo-o-ly-tap-to-chu-so.jpg'),
	('SP0033', 'bo-sach-giao-khoa-lop-3.jpg'),
	('SP0034', 'bo-sach-giao-khoa-lop-1.jpg'),
	('SP0035', 'bo-sach-giao-khoa-lop-6.jpg'),
	('SP0036', 'bo-sach-giao-khoa-lop-8.jpg'),
	('SP0037', 'bo-sach-giao-khoa-lop-9.jpg'),
	('SP0038', 'tu-hoc-2000-tu-vung-tieng-anh.jpg'),
	('SP0039', 'Cambridge-Ielts-11-Academic-With-Answers.jpg'),
	('SP0040', 'tieng-nhat-cho-moi-nguoi.jpg'),
	('SP0041', '25-chuyen-de-ngu-phap-trong-tam.jpg'),
	('SP0042', 'giai-thich-ngu-phap-tieng-anh.jpg'),
	('SP0043', 'Song-of-Achilles.jpg'),
	('SP0044', 'Five-People-You-Meet-in-Heaven.jpg'),
	('SP0045', 'Find-Me-A-Novel.jpg'),
	('SP0046', 'Circe.jpg'),
	('SP0047', 'Normal-People-A-Novel.jpg'),
	('SP0048', 'Creativity.jpg'),
	('SP0049', 'Zere-to-One.jpg'),
	('SP0050', 'The-Tipping-Point.jpg'),
	('SP0051', 'Bad-Blood.jpg'),
	('SP0052', 'No-Rules-Rules.jpg'),
	('SP0053', 'Atomic-Habits.jpg'),
	('SP0054', 'The-Subtle-Art-of-Not-Giving.jpg'),
	('SP0055', 'Rich-Dad-Poor-Dad.jpg'),
	('SP0056', 'the_power_of_habit.jpg'),
	('SP0057', 'Barking-Up-The-Wrong-Tree.jpg'),
	('SP0058', 'Women-Who-Run-with-the-Wolves.jpg'),
	('SP0059', 'Harry-Potter-And-The-Half.jpg'),
	('SP0060', 'The-Very-Hungry-Caterpillar.jpg'),
	('SP0061', 'Harry-Potter-and-the-Philosopher.jpg'),
	('SP0062', 'Harry-Potter-And-The-Half-Blood-Prince.jpg'),
	('SP0063', 'Lift-the-flap-Very-First-Questions-and-Answers-What-is-poo.jpg'),
	('SP0064', 'Harry-Potter-and-the-Philosopher.jpg'),
	('SP0065', 'Family-And-Friends-Special-Edition-4.jpg'),
	('SP0066', 'Access-Grade-7-Student.jpg'),
	('SP0067', 'Access-Grade-7-Workbook.jpg'),
	('SP0068', 'English-Grammar-in-Use-Book-w-Ans.jpg'),
	('SP0069', 'Family-And-Friends-Special-Editio-3.jpg'),
	('SP0070', 'ba-lo-chong-gu-be-trai.jpg'),
	('SP0071', 'bao-tap.jpg'),
	('SP0072', 'thuoc-ke.jpg'),
	('SP0073', 'bop-viet.jpg'),
	('SP0074', 'bop-viet-vai-tiger.jpg'),
	('SP0075', 'file-tai-lieu-dung-campus.jpg'),
	('SP0076', 'bam-kim-so-10.jpg'),
	('SP0077', 'bia-cong-xanh-chuoi.jpg'),
	('SP0078', 'bia-nut.jpg'),
	('SP0079', 'ong-dung-but.jpg'),
	('SP0080', 'vo-ve-crabit.jpg'),
	('SP0081', 'bo-mau-ve-masterart.jpg'),
	('SP0082', 'bo-mau-ve-masterart-12-mau.jpg'),
	('SP0083', 'tap-ve-401.jpg'),
	('SP0084', 'tuyp-mau-poster.jpg'),
	('SP0085', 'mouse-bitis-lam-hoa.jpg'),
	('SP0086', 'giay-soi-size-s-mau-cam.jpg'),
	('SP0087', 'tui-giay-hoa-tiet.jpg'),
	('SP0088', 'hop-thiet-dung-tien.jpg'),
	('SP0089', 'vong-hoa-trang-tri-giang-sinh.jpg')

CREATE TABLE DIACHI (
	Id int identity not null,
	IdKhachHang varchar(10) not null,
	Tinh nvarchar(50),
	Huyen nvarchar(50),
	Xa nvarchar(50),
	DiaChi nvarchar(50),
	MacDinh bit default(0),
	
	primary key (Id),
	constraint fk_diachi_kh
	foreign key (IdKhachHang)
	references KHACHHANG(Id)
)

CREATE TABLE GIOHANG (
	IdKhachHang varchar(10) not null,
	IdHangHoa varchar(10) not null,
	SoLuong int not null,
	
	primary key (IdKhachHang, IdHangHoa),
	constraint fk_giohang_kh
	foreign key (IdKhachHang)
	references KHACHHANG(Id),
	constraint fk_giohang_hh
	foreign key (IdHangHoa)
	references SANPHAM(Id)
)

CREATE TABLE HOADON (
	Id varchar(10) not null,
	IdKhachHang varchar(10) not null,
	ThoiGianLap datetime,
	TrangThai nvarchar(50),
	del_flag bit default(1),
	
	primary key (Id),
	constraint fk_hoadon_kh
	foreign key (IdKhachHang)
	references KHACHHANG(Id)
)

CREATE TABLE CHITIETHOADON (
	IdHoaDon varchar(10) not null,
	IdHangHoa varchar(10) not null,
	SoLuong int not null,
	DonGia money not null,
	KhuyenMai int,
	del_flag bit default(1),
	
	primary key (IdHoaDon, IdHangHoa),
	constraint fk_chitiet_hoadon
	foreign key (IdHoaDon)
	references HOADON(Id),
	constraint fk_chitiet_sanpham
	foreign key (IdHangHoa)
	references SANPHAM(Id)
)

CREATE TABLE ADM (
	Id varchar(10) not null,
	TenDangNhap varchar(50) not null,
	HoTen nvarchar(50),
	MatKhau varchar(50) not null,
	del_flag bit default(1),

	primary key (Id)
)

INSERT INTO ADM(Id, TenDangNhap, MatKhau, HoTen)
VALUES
	('AD01', 'admin', '123', N'Nguyễn Phan Minh Thư')

CREATE TABLE TINTUC (
	Id varchar(10) not null,
	TieuDe nvarchar(max),
	TomTat nvarchar(max),
	UrlHinh varchar(max),
	NgayDang datetime,
	IdAdmin varchar(10) not null, -- id admin đăng bài
	NoiDung nvarchar(max),
	TrangThai bit default(1), -- hiển thị hay ẩn
	del_flag bit default(1),

	primary key (Id),

	constraint fk_tintuc_admin
	foreign key (IdAdmin)
	references ADM(Id)
)

INSERT INTO TINTUC(Id, TieuDe, TomTat, UrlHinh, NgayDang, IdAdmin, NoiDung)
VALUES
	('TT0001', N'Cách giúp bạn rèn luyện thói quen đọc sách mỗi ngày cực hiệu quả', 
	N'Sách là người bạn của trí tuệ và là thứ sẽ đưa chúng ta đến những tầng cao mới. Khi bạn có một khối tri thức khổng lồ, bạn sẽ nâng cao được giá trị của bản thân. Thậm chí khi có tri thức bạn có thể giúp được cả những người xung quanh mình. Hãy đọc bài viết sau để hiểu được giá trị cũng như định hình thói quen đọc sách, phương pháp đọc tối ưu nhất nhé.',
	'ren-thoi-quen-doc.jpg',
	'10/27/2021',
	'AD01',
	N'<p>Xác định rõ mục tiêu kiến thức</p>
	<p>Khi bạn còn nhỏ, thì bạn có thể đọc đa dạng các loại sách nhưng lớn hơn thì bạn cần rõ ràng trong việc chọn lựa sách. Vì thời gian bạn không còn nhiều và bạn cần phải tập trung thì sẽ tốt hơn. Bạn sẽ có 2 vấn đề đó là kiến thức chuyên môn và kiến thức xã hội. Hai dòng kiến thức này sẽ hỗ trợ bạn rất nhiều trong công việc cũng như cuộc sống. 
	Những loại sách có kiến thức chuyên môn thường khô khan và sẽ khiến bạn nhàm chán. Vì thế, bạn nên có thêm 1 quyển khác gối đầu giường để giúp mình thư giãn. Quyển đó như là một sự đam mê, yêu thích của mình, gọi chung là kiến thức xã hội, đời sống. Hãy xác định mục tiêu trước, mình muốn tìm hiểu về điều gì? Mình cần nâng cấp chuyên môn nào? 
	Luyện tập thói quen đọc sách mỗi không chỉ đơn thuần là đọc rồi ghi chú hay khô cứng mà nó còn phụ thuộc vào tuỳ giai đoạn. Một ví dụ điển hình là khi bạn đang chán đời, chán việc, bắt bạn đọc nghiên cứu thêm về công việc thì sao mà nuốt trôi. Đó là cảm xúc, và con người chúng ta sẽ luôn bị cảm xúc chi phối. 
	Khi bạn uể oải, stress và mất hết năng lượng hãy dùng những quyển sách self help, nó có thể sẽ vực bạn dậy. Tuy nhiên, liều thuốc bổ không được dùng quá nhiều, nếu không bạn sẽ bị lạm dụng. Khi đó, bạn sống trong viển vông. Đừng để chúng ta sa lầy quá nhiều vào những quyển sách self help. Ngoài ra, bạn nên đọc tiểu thuyết vì nó là thứ nói lên rất nhiều thứ mà xã hội hiện thực không có.</p>
	<p>Tạo văn hoá đọc mỗi ngày</p>
	<p>Đây là điều rất quan trọng cho những người đọc sách. Nếu từ đầu bạn không yêu đọc sách thì bắt buộc phải làm chuyện này. Vì nếu không, bạn sẽ rất ngán ngẩm và bỏ giữa chừng. Chính điều đó nên đa số ta cần đọc cái ta thích trước, sau đó ta sẽ đọc cái ta cần. Khi bạn quen với chữ, với kiểu ngồi hàng giờ cầm sách thì cần phải tập.
	Những cuốn sách ban đầu bạn đọc để tạo ra văn hoá đọc. Bạn cần chọn lọc sách nhẹ nhàng, tiểu thuyết, những thứ làm bạn say mê. Rồi mỗi ngày dành ra bao nhiêu thời gian để đọc, ghi chú thời gian rõ ràng. Hãy hình thành thói quen.</p>
	<p>Ghi chú hoặc gấp dấu</p>
	<p>Phương pháp đọc sách này được nhiều người sử dụng khi đọc các quyển sách chuyên ngành. Bạn cần ghi chú lại ra nháp để nhớ hoặc tra cứu. Ví dụ bạn đọc sách về luật, có một số thuật ngữ chuyên ngành là “đương đơn, bị cáo, giấy triệu tập,...” bạn không hiểu thì ghi lại. Sau đó lên google tra các khái niệm, là bạn sẽ hiểu hết được khúc đó nói gì. Ngoài ra, bạn cũng nên dùng bút dạ quang để đánh dấu các keyword. Có những trang cần gấp dấu thì chú ý ghi số ở quyển sổ tay. </p>
	<p>Nhẩm lại ý nghĩa chính sau khi đọc</p>
	<p>Bạn chỉ cần bỏ ra 10 phút để nhớ lại những keyword chính, điểm cốt yếu. Nó giống như việc bạn hệ thống lại bộ não của mình về kiến thức đó. Hãy củng cố lại tất cả những gì bạn đọc được. Đặc biệt đối với những loại sách chuyên ngành. Bạn có thể ghi chú hoặc không, tốt nhất hãy lưu lại vào bộ não. Như vậy, dẫu có quên thì bạn cũng sẽ có thể nhớ lại dễ dàng khi cần hoặc ai đó nhắc lại.
	Thói quen đọc sách mỗi ngày sẽ giúp bạn nâng cao tri thức, chất lượng cuộc sống. Đây là những “liều thuốc bổ não” để giúp bạn trở nên tốt hơn. Những quyển sách dù như thế nào đi nữa, ít nhiều gì cũng sẽ có điều gì đó cho bạn học hỏi. Thậm chí trong 1 quyển sách có 1 trang làm thay đổi suy nghĩ của bạn thì hãy mua nó. </p>
	<i><p>“Một trang sách trong một quyển thay đổi 1% con người thì một quyển sẽ thay đổi cả cuộc đời bạn.”</i></p>'),
	('TT0002', N'4 tác phẩm văn học Việt Nam nên đọc', 
	N'Các tác phẩm văn học Việt Nam từ xưa đến nay phong phú và đang dạng. Bên cạnh đó, có nhiều loại tiểu thuyết mô tả tính hiện thực sâu sắc, gắn liền với những con người rất bình thường. Từ đó, bạn đọc có thể hiểu rõ xã hội thực và tâm lý, hoàn cảnh, văn hoá của con người và xã hội.',
	'sach-hay-nen-doc.jpg',
	'10/31/2021',
	'AD01',
	N'<p>1. Gió lạnh đầu mùa - Thạch Lam</p>
	<p>Tác phẩm mang tên Thạch Lam đặc biệt rất đơn giản. Thông thường chỉ là những câu chuyện không phải chuyện, nhẹ nhàng như một đoạn phim ngắn. Tác giả muốn thông qua tâm trạng nhân vật để có thể phản chiếu một cách chân thật nhất về mỗi câu chuyện hằng ngày. Cuộc sống của nhân vật với những sự rất đỗi bình thường.</p>
	<p>Suy nghĩ của Thạch Lam về văn chương: “Đối với tôi văn chương không phải là một cách đem đến cho người đọc sự thoát li hay sự quên, trái lại văn chương là một thứ khí giới thanh cao và đắc lực mà chúng ta có, để vừa tố cáo và thay đổi một cái thế giới giả dối và tàn ác, làm cho lòng người được thêm trong sạch và phong phú hơn.”</p>
	<p>Giống với Hai đứa trẻ, khi chị em Liên ngồi đợi những chuyến tàu từ Hà Nội, họ mải mê ngắm nhìn phố chợ về đêm, trong cái thưa thớt, vắng vẻ ấy mà thấu hiểu sự vất vả, tối tăm của cuộc sống thường ngày nhưng sâu tận đáy lòng vẫn luôn hướng đến một cuộc sống tốt đẹp hơn.</p>
	<p>2. Tắt đèn - Ngô Tất Tố</p>
	<p>Đây là 1 trong những tác phẩm văn học Việt Nam kinh điển không thể bỏ qua. Ngô Tất Tố được coi là nhà văn hàng đầu của trào lưu hiện thực phê phán ở Việt Nam trước 1945, ông có nhiều tác phẩm để đời như Tắt đèn, Việc làng, Tập án cái đình, Lều chõng.</p>
	<p>Tắt đèn của nhà văn Ngô Tất Tố phản ánh rất chân thực cuộc sống khốn khổ của tầng lớp nông dân Việt Nam đầu thế kỷ XX dưới ách đô hộ của thực dân Pháp. Tác phẩm xoay quanh nhân vật chị Dậu và gia đình – một điển hình của cuộc sống bần cùng hóa sưu cao thuế nặng mà chế độ thực dân áp đặt lên xã hội Việt Nam. </p>
	<p>Trong cơn cùng cực chị Dậu phải bán khoai, bán bầy chó đẻ và bán cả đứa con để lấy tiền nộp sưu thuế cho chồng nhưng cuộc sống vẫn đi vào bế tắc, không lối thoát.</p>
	<p>3. Chí Phèo - Nam Cao</p>
	<p>Tác phẩm văn học Việt Nam “Chí Phèo” được nhà văn Nam Cao đặt tên trong bản thảo là “Cái lò gạch cũ”, nhưng có lẽ nhằm gây chú ý cho công chúng đương thời, nhà văn Lê văn Trương khi viết lời tựa cho tập truyện đã đổi thành “Đôi lứa xứng đôi”. Về sau, khi in lại truyện này trong tuyển tập “Luống cày” (tập truyện của 4 tác giả: Nam Cao, Nguyên Hồng, Nguyễn Huy Tưởng, Kim Lân) tác giả Nam Cao đổi tên truyện của mình thành “Chí Phèo”.</p>
	<p>Truyện ngắn Chí Phèo đã nói lên sự thực khốc liệt của xã hội phong kiến thực dân xưa, đã coi con người như cỏ rác. Sự đau lòng đến tận xương tuỷ, sự lương thiện bị vùi dập nhưng vẫn nhem nhóm và cháy lên trong từng chi tiết.</p>
	<p>“Cái chết của con Mực” cũng là trang viết về nỗi lòng lực bất tòng tâm của người trí thức nghèo trước thời cuộc; riêng hai truyện “Ma đưa” và “Chú Khì người đánh tổ tôm vô hình”  thuộc loại truyện ma, trong đó Nam Cao ghi lại những nét thuộc đời sống tâm linh, tâm thức dị đoan của người dân các làng quê thời đấy.</p>
	<p>4. Số Đỏ - Vũ Trọng Phụng</p>
	<p>SỐ ĐỎ Tác phẩm Số đỏ, tác giả Vũ Trọng Phụng(20/10/1912-13/10/1939)- “Ông vua phóng sự đất Bắc”. “Số đỏ” được đăng ở Hà Nội báo ngày 7/10/1936 được xem là tác phẩm lớn nhất trong sự nghiệp sáng tác văn học của Vũ Trọng Phụng, cùng với “ Giông tố” là thùng thuốc nổ ném vào giữa xã hội thực dân. </p>
	<p>“Số đỏ” xoay quanh nhân vật làm đảo điển Hà Nội những năm 1930-1940, Xuân Tóc Đỏ- từ một thằng bé mồ côi, kiếm sống bằng đủ thứ nghề: trèo me, trèo sấu, quảng cáo thuốc lậu...nhờ thủ đoạn xảo trá, “nhờ thời” đã trở thành me xừ, được mời vào hội Khai trí Tiến đức và cuối cùng được nhận huân chương Bắc Đẩu bội tinh.</p>
	<p>Sử dụng lối tương phản cái đồi bại, thối nát vô luân với cái hài, cái trào phúng, tiểu thuyết thành công trong việc lột trần những “quái thai” thời đại trong buổi giao thời.</p>');

CREATE TABLE PHANHOI (
	Id varchar(10) not null,
	HoTen nvarchar(50),
	Email varchar(50),
	SoDienThoai varchar(50),
	YKien nvarchar(max),

	primary key (Id)
)

/*
SELECT SANPHAM.*, CASE WHEN SoLuong IS NULL THEN 0 ELSE SoLuong END AS DaBan FROM SANPHAM
LEFT JOIN
	(SELECT IdHangHoa, SUM(SoLuong) AS SoLuong FROM CHITIETHOADON
	FULL JOIN SANPHAM ON SANPHAM.Id = CHITIETHOADON.IdHangHoa
	WHERE SANPHAM.id = CHITIETHOADON.IdHangHoa
	GROUP BY CHITIETHOADON.IdHangHoa) AS B ON SANPHAM.Id = B.IdHangHoa
ORDER BY DaBan DESC 

SELECT TenSanPham, Gia, KhuyenMai, SoLuong FROM CHITIETHOADON
INNER JOIN SANPHAM ON CHITIETHOADON.IdHangHoa = SANPHAM.Id
WHERE IdHoaDon = 'HD0001'

DELETE FROM DIACHI WHERE IdKhachHang = 'KH0002'

DELETE FROM KHACHHANG WHERE Id = 'KH003'

SELECT LOAISANPHAM.*, TenDanhMuc FROM LOAISANPHAM 
INNER JOIN DANHMUCSANPHAM ON LOAISANPHAM.IdDanhMuc = DANHMUCSANPHAM.Id
WHERE LOAISANPHAM.Id = 'LSP01'

SELECT IdHangHoa, TenSanPham, Gia, KhuyenMai, SUM(SoLuong) AS DaBan FROM CHITIETHOADON
INNER JOIN SANPHAM ON CHITIETHOADON.IdHangHoa = SANPHAM.Id
INNER JOIN HOADON ON HOADON.Id = CHITIETHOADON.IdHoaDon
WHERE ThoiGianLap BETWEEN '09/28/2021' AND '12/01/2021'
GROUP BY IdHangHoa, TenSanPham, Gia, KhuyenMai
ORDER BY SUM(SoLuong) DESC

SELECT IdHangHoa, TenSanPham, SUM(SoLuong) AS DaBan, SUM(SoLuong*(DonGia - CHITIETHOADON.KhuyenMai*DonGia)) as TienThu FROM CHITIETHOADON
INNER JOIN SANPHAM ON CHITIETHOADON.IdHangHoa = SANPHAM.Id
INNER JOIN HOADON ON HOADON.Id = CHITIETHOADON.IdHoaDon
WHERE ThoiGianLap BETWEEN '09/28/2021' AND '12/01/2021'
GROUP BY IdHangHoa, TenSanPham
ORDER BY SUM(SoLuong) DESC
*/

SELECT IdHangHoa, TenSanPham, SUM(SoLuong) AS DaBan, SUM(SoLuong*(DonGia - CHITIETHOADON.KhuyenMai/100.0*DonGia)) as TienThu FROM CHITIETHOADON
INNER JOIN SANPHAM ON CHITIETHOADON.IdHangHoa = SANPHAM.Id
INNER JOIN HOADON ON HOADON.Id = CHITIETHOADON.IdHoaDon
WHERE ThoiGianLap BETWEEN '09/28/2021' AND '12/01/2021'
GROUP BY IdHangHoa, TenSanPham
ORDER BY SUM(SoLuong) DESC

select * from giohang

SELECT IdHangHoa, TenSanPham, SUM(SoLuong) AS DaBan, SUM(SoLuong*(DonGia - CHITIETHOADON.KhuyenMai/100.0*DonGia)) as TienThu FROM CHITIETHOADON
INNER JOIN SANPHAM ON CHITIETHOADON.IdHangHoa = SANPHAM.Id
INNER JOIN HOADON ON HOADON.Id = CHITIETHOADON.IdHoaDon
WHERE convert(date, ThoiGianLap) >= convert(date1, ?) AND convert(date, ThoiGianLap) <= convert(date2, ?)
GROUP BY IdHangHoa, TenSanPham
ORDER BY SUM(SoLuong) DESC