import 'dart:async';

class CounterBloc {
  // kita buat variabel counter sbg penampung
  int _counter = 0;

  // kita buat getter ,  agar variabel counter sbg penampung dapat di panggil di luar
  int get counter {
    return _counter;
  }

  // membuat selang penghubung data input
  StreamController _inputanController = StreamController();

  // stream_sinc sebagai tempat memasukan data
  StreamSink get sinkInputan => _inputanController.sink;

  // membuat selang penghubung data output
  StreamController _outputanController = StreamController();

  // stream_sinc sebagai tempat keluar data
  StreamSink get _sinkOutputan => _outputanController.sink;

  // tempat keluarnya data , yang dikirim melalui sinkOutputan melalui _outputanController
  Stream get output => _outputanController.stream;

  // mesin bloc dijalankan didalam contructor class
  CounterBloc() {
    _inputanController.stream.listen(
      (event) {
        if (event == 'add') {
          _counter++;
        } else {
          if (_counter != 0) {
            _counter--;
          }
        }

        // setelah data di proses , data di pindahkan ke sinkOutputan
        // untuk dikirim ke stream melalui kurir controller _outputanController
        _sinkOutputan.add(_counter);
      },
    );
  }

  // kita juga wajib menutup aliran data , ketika sudah tidak terpakai .
  void dispose() {
    // yang ditutup adalah pipa nya / controller nya
    _inputanController.close();
    _outputanController.close();
  }
}
