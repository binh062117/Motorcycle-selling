package com.motorcycle.dao;

import com.motorcycle.model.Brand;
import com.motorcycle.model.Category;
import com.motorcycle.model.Notification;
import com.motorcycle.model.Order;
import com.motorcycle.model.Payment;
import com.motorcycle.model.Product;
import com.motorcycle.model.Review;
import com.motorcycle.model.Role;
import com.motorcycle.model.User;
import com.motorcycle.model.Voucher;
import com.motorcycle.util.PasswordUtil;
import java.math.BigDecimal;

public final class AppDatabase {
    public static final InMemoryRepository<Role> roles = new InMemoryRepository<Role>();
    public static final InMemoryRepository<User> users = new InMemoryRepository<User>();
    public static final InMemoryRepository<Brand> brands = new InMemoryRepository<Brand>();
    public static final InMemoryRepository<Category> categories = new InMemoryRepository<Category>();
    public static final InMemoryRepository<Product> products = new InMemoryRepository<Product>();
    public static final InMemoryRepository<Order> orders = new InMemoryRepository<Order>();
    public static final InMemoryRepository<Payment> payments = new InMemoryRepository<Payment>();
    public static final InMemoryRepository<Voucher> vouchers = new InMemoryRepository<Voucher>();
    public static final InMemoryRepository<Review> reviews = new InMemoryRepository<Review>();
    public static final InMemoryRepository<Notification> notifications = new InMemoryRepository<Notification>();

    private static boolean seeded;

    private AppDatabase() {
    }

    public static synchronized void seed() {
        if (seeded) {
            return;
        }

        Role admin = roles.save(new Role(1, "Admin"));
        Role customer = roles.save(new Role(2, "Customer"));

        users.save(new User(1, "Admin", "Ducati", "admin@ducati.local", "0900000000", PasswordUtil.sha256("admin123"), admin));
        users.save(new User(2, "Enzo", "Ferrari", "enzo@ferrari.it", "0912345678", PasswordUtil.sha256("123456"), customer));

        Brand ducati = brands.save(new Brand(1, "Ducati", "Ý"));
        Brand honda = brands.save(new Brand(2, "Honda", "Nhật Bản"));
        Brand yamaha = brands.save(new Brand(3, "Yamaha", "Nhật Bản"));

        Category superbike = categories.save(new Category(1, "Superbike", "Sport performance motorcycles"));
        Category streetfighter = categories.save(new Category(2, "Streetfighter", "Naked high-performance motorcycles"));
        Category adventure = categories.save(new Category(3, "DesertX", "Adventure motorcycles"));
        Category monster = categories.save(new Category(4, "Monster", "Urban naked motorcycles"));

        Product p1 = new Product(1, "Panigale V4 R", "DUC-PV4R-2026", ducati, superbike, new BigDecimal("1250000000"), 12);
        p1.setDisplacement("998 cc");
        p1.setHorsepower("218 cv");
        p1.setWeight("175 kg");
        p1.setImageUrl("https://lh3.googleusercontent.com/aida-public/AB6AXuDYaUgSyMjF2qyeANufko_6y8VXa5bfok5skMmc13RxhIplARwGgC1UyHtfRFqo1KuijEdwcVqiup9wIWGifQbavYlkmtJjWNCbOsRKCxRIf6B5s07fh2Uct2by0EuQzD810e7XEFK3VTDURj5VKUPmnTCtdtyVp219YUDgPJyAihyknfqxoaKoNrY3E2IcC5ILHfyBfAkOOfbTby5m9-8H-Jav7GAgAosrwm_OdB6YgGNOVCsjN0Vnd7iOv8DutpBBIPZ_7oPqUt67");
        products.save(p1);

        Product p2 = new Product(2, "Streetfighter V4 SP2", "DUC-SFV4-2026", ducati, streetfighter, new BigDecimal("980000000"), 8);
        p2.setDisplacement("1103 cc");
        p2.setHorsepower("208 cv");
        products.save(p2);

        Product p3 = new Product(3, "DesertX Discovery", "DUC-DX-2026", ducati, adventure, new BigDecimal("689000000"), 10);
        p3.setDisplacement("937 cc");
        products.save(p3);

        Product p4 = new Product(4, "Monster SP", "DUC-MON-2026", ducati, monster, new BigDecimal("455000000"), 15);
        p4.setDisplacement("937 cc");
        products.save(p4);

        products.save(new Product(5, "CBR1000RR-R", "HON-CBR-2026", honda, superbike, new BigDecimal("950000000"), 7));
        products.save(new Product(6, "YZF-R1M", "YAM-R1M-2026", yamaha, superbike, new BigDecimal("860000000"), 5));
        vouchers.save(new Voucher(1, "DUCATI10", new BigDecimal("10")));
        seeded = true;
    }
}
