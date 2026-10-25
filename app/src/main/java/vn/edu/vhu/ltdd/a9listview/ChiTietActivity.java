package vn.edu.vhu.ltdd.a9listview;

import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class ChiTietActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chi_tiet);

        ImageView imgChiTiet = findViewById(R.id.imgChiTiet);
        TextView tvTen = findViewById(R.id.tvChiTietTen);
        TextView tvGia = findViewById(R.id.tvChiTietGia);
        TextView tvMoTa = findViewById(R.id.tvChiTietMoTa);
        Button btnQuayLai = findViewById(R.id.btnQuayLai);

        MonAn mon = getIntent().getParcelableExtra("mon_an");
        if (mon != null) {
            imgChiTiet.setImageResource(mon.getAnhResId());
            tvTen.setText(mon.getTen());
            tvGia.setText(MonAn.dinhDangGia(mon.getGia()));
            tvMoTa.setText(mon.getMoTa());
        }

        btnQuayLai.setOnClickListener(v -> finish());
    }
}
