package mapper;

import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.jdbc.SQL;
import pojo.Bike;

public interface BikeMapper {

    class BikeProvider {
        public String inserBikeByCondition(final Bike bike) {
            return new SQL() {{
                INSERT_INTO("t_bike");
                if (bike.getPrice().equals("0")) {
                    VALUES("price", bike.getPrice());
                }
                VALUES("id","#{id}");
                VALUES("color", "#{color}");
                VALUES("brand", "brand");
                VALUES("user_id", "#{userId}");
                VALUES("create_time", "#{createTime}");
                VALUES("update_time", "#{update_time}");
                if (!bike.getChipId().isEmpty()) {
                    VALUES("chip_id", "#{chipId}");
                }
                if (!bike.getPlateId().isEmpty()) {
                    VALUES("plate_id", "#{plateId}");
                }
            }}.toString();
        }
    }

    @InsertProvider(type = BikeProvider.class, method = "inserBikeByCondition")
    int insertBike(Bike bike);
}
