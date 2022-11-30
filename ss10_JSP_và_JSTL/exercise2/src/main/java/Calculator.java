public class Calculator {
    public static double calculate(double firstOperand, double secondOperand, char operator ){
        switch (operator){
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
             case '*':
                return firstOperand * secondOperand;
             case '/':
                 if (secondOperand!=0) {
                     return firstOperand / secondOperand;
                 }else {
                     throw new RuntimeException("Không thể chia cho số 0");
                 }
            default:
                throw new RuntimeException("hãy chọn 1 phép tính");
        }
    }
}
