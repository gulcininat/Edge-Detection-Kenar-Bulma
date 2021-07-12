# Edge-Detection-Kenat-Bulma
Canny, Laplacian, Prewitt, Robert, Sobel, Zero cross, Knear bulma algoritmaları ayrı ayrı matlab kodları verilmiştir. 


lena.png görüntüsünü kendi bilgisayarınızdaki uzantı ile koddaki uzantıyı değiştirmeyi unutmayın. 

    sobel_kenar.m dosyası: 
Yukarıda verilen matlab kodunda, lena.png resminin okunması, siyah beyaza çevrilmesi, sobel kenar uygulaması bulunmaktadır. Sonrasında, aynı orijinal resme gaussian filtre kullanılarak blur işlemi gerçekleştirilmiş ve blurlu resmin siyah beyaza çevrilmesi ve ardından sobel kenar uygulaması bulunmaktadır. 
Orijinal resme sobel kenar uygulandığında, tüm kenarları bulmayı yaklaşmıştır fakat bunun yanı sıra desenleri de göstermiştir. Resim blurlandıktan sonra uygulanmasında ise, desenler biraz daha azalmıştır, kızın saçını ve şapkasını daha az çizmiştir. 

    prewitt_kenar.m dosyası: 
Yukarıda verilen matlab kodunda, lena.png resminin okunması, siyah beyaza çevrilmesi, prewitt kenar uygulaması bulunmaktadır. Sonrasında, aynı orijinal resme gaussian filtre kullanılarak blur işlemi gerçekleştirilmiş ve blurlu resmin siyah beyaza çevrilmesi ve ardından prewitt kenar uygulaması bulunmaktadır.
Orijinal resme prewitt kenar uygulandığında, tüm kenarları bulmayı yaklaşmıştır fakat bunun yanı sıra desenleri de göstermiştir. Resim blurlandıktan sonra uygulanmasında ise, desenler biraz daha azalmıştır, kızın saçını ve şapkasını daha az çizmiştir. Sobel kenar uygulaması ile yaklaşık sonuçları vermiştir.

    robert_kenar.m dosyası: 
Yukarıda verilen matlab kodunda, lena.png resminin okunması, siyah beyaza çevrilmesi, Robert kenar uygulaması bulunmaktadır. Sonrasında, aynı orijinal resme gaussian filtre kullanılarak blur işlemi gerçekleştirilmiş ve blurlu resmin siyah beyaza çevrilmesi ve ardından robert kenar uygulaması bulunmaktadır.
Orijinal resme Robert kenar uygulandığında, tüm kenarları bulmayı yaklaşmıştır fakat bunun yanı sıra desenleri de göstermiştir. Resim blurlandıktan sonra uygulanmasında ise, desenler biraz daha azalmıştır, kızın saçını ve şapkasını daha az çizmiştir. Sobel ve prewitt kenar uygulamasından daha iyi sonuç vermiştir ve Robert algoritmasında kenar çizgileri daha ince çizgiler ile gösterilmektedir. 

    laplacian_kenar.m dosyası: 
Yukarıda verilen matlab kodunda, lena.png resminin okunması, siyah beyaza çevrilmesi, laplacian kenar uygulaması bulunmaktadır. Sonrasında, aynı orijinal resme gaussian filtre kullanılarak blur işlemi gerçekleştirilmiş ve blurlu resmin siyah beyaza çevrilmesi ve ardından laplacian kenar uygulaması bulunmaktadır. 
Orijinal resme laplacian kenar uygulandığında, tüm kenarları bulmayı yaklaşmıştır fakat bunun yanı sıra desenleri de göstermiştir. Resim blurlandıktan sonra uygulanmasında ise, desenler biraz daha azalmıştır, kızın saçını ve şapkasını daha az çizmiştir. Kızın yüzünde, arkadaki desende kopmalar görülmüştür. Sobel ve prewitt kenar uygulamasından daha iyi sonuç vermiştir ve Robert algoritmasında da olduğu gibi laplapcian kenar algoritmasında da kenar çizgileri daha ince çizgiler ile gösterilmektedir. 

     zero_cross_belirleme.m dosyası:
Yukarıda verilen matlab kodunda, lena.png resminin okunması, siyah beyaza çevrilmesi, zero cross kenar uygulaması bulunmaktadır. Sonrasında, aynı orijinal resme gaussian filtre kullanılarak blur işlemi gerçekleştirilmiş ve blurlu resmin siyah beyaza çevrilmesi ve ardından zero cross kenar uygulaması bulunmaktadır.
Orijinal resme zero cross kenar uygulandığında, tüm kenarları bulmayı yaklaşmıştır fakat bunun yanı sıra desenleri de göstermiştir. Resim blurlandıktan sonra uygulanmasında ise, desenler biraz daha azalmıştır. Arkadaki desende kopmalar görülmüştür fakat diğer uygulamaların aksine kızın saçında ve yüzünde kopmalar yapmamıştır. Robert ve Laplacian algoritmasında da olduğu gibi kenar çizgileri daha ince çizgiler ile gösterilmektedir. 

      canny_kenar.m dosyası: 
Yukarıda verilen matlab kodunda, lena.png resminin okunması, siyah beyaza çevrilmesi, canny kenar uygulaması bulunmaktadır. Sonrasında, aynı orijinal resme gaussian filtre kullanılarak blur işlemi gerçekleştirilmiş ve blurlu resmin siyah beyaza çevrilmesi ve ardından canny kenar uygulaması bulunmaktadır. 
Orijinal resme canny kenar uygulandığında, tüm kenarları bulmayı yaklaşmıştır fakat bunun yanı sıra desenleri de göstermiştir. Resim blurlandıktan sonra uygulanmasında ise, desenler biraz daha azalmıştır ve ilk uygulama ile arasında farklılıklar oluşmuştur: Bazı yerlerde desenleri değiştirmiş, kopmalar ya da tamamlamalar yapmıştır. Canny diğer kenar algoritmaları arasından en detay veren algoritmadır. Desenleri en çok belli eden de bu uygulamadır.      
