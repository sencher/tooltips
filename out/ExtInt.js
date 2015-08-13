/**
 * Created by SenCheR on 12.08.2015.
 */
// adds two numbers, and sends the result back to ActionScript
function addNumbers(num1, num2)
{
    return (num1 + num2);
}

function onClick() {
    // callResult gets the value "busy signal"
    var callResult = flashObject.myFunction("my name");
    //alert(callResult);
    console.log(callResult);
}

window.onbeforeunload = function (e) {
    //sound.play();
    //alert("dd");
    console.log(e);
    onClick();
    //s = 'Вы уверены, что желаете закрыть окно?!'
    //
    //e = e || window.event;
    //
    //// For IE and Firefox prior to version 4
    //if (e) {
    //    e.returnValue = s;
    //}
    //
    //// For Safari
    //return s;
};