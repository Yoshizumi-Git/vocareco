function printHelloWithButton() {
  var btn = document.querySelector("input");

  function printHello() {
    alert('送信しました');
  }
  // 関数内で定義された関数は、関数の中でしか呼び出せないという性質があるだけで、
  // 通常の関数同様に呼び出せる

  btn.addEventListener("click", printHello);
}
// 一連の処理をまとめた関数を作る

window.addEventListener("load", printHelloWithButton);