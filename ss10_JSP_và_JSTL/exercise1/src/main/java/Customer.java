public class Customer {
    private String name;
    private String birthDate;
    private String address;
    private String image;

    public Customer(String name, String birthDate, String address, String image) {
        this.name = name;
        this.birthDate = birthDate;
        this.address = address;
        this.image = image;
    }

    public Customer() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
