module com.spdw {
    requires javafx.controls;
    requires javafx.fxml;

    opens com.spdw to javafx.fxml;
    exports com.spdw;
}
