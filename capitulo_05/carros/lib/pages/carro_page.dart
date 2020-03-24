import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/pages/favoritos/favorito_service.dart';
import 'package:carros/pages/loripsum.dart';
import 'package:carros/pages/widgets/text.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatefulWidget {
  final Carro carro;
  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _loripsumBloc = LoripsumBloc();
  Carro get carro => widget.carro;

  @override
  void initState() {
    super.initState();
    _loripsumBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.place,
            ),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(
              Icons.videocam,
            ),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: (value) => _onClickPopupMenu(value),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'Editar',
                  child: Text('Editar'),
                ),
                PopupMenuItem(
                  value: 'deletar',
                  child: Text('Deletar'),
                ),
                PopupMenuItem(
                  value: 'Share',
                  child: Text('Share'),
                ),
              ];
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          CachedNetworkImage(imageUrl: widget.carro.urlFoto),
          _bloco1(),
          Divider(),
          _bloco2(),
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(
              widget.carro.nome,
              fontSize: 20,
              bold: true,
            ),
            text(
              widget.carro.tipo,
            ),
          ],
        ),
        Spacer(),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 40,
              ),
              onPressed: _onClickFavorite,
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                size: 40,
              ),
              onPressed: _onClickShare,
            ),
          ],
        ),
      ],
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(widget.carro.descricao, fontSize: 14, bold: true),
        SizedBox(
          height: 24,
        ),
        StreamBuilder(
          stream: _loripsumBloc.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return text(snapshot.data);
          },
        )
      ],
    );
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case 'Editar':
        break;
      case 'Deletar':
        break;
      case 'Share':
        break;
    }
  }

  void _onClickShare() {}

  void _onClickFavorite() {
    FavoritoService.favoritar(carro);
  }

  @override
  void dispose() {
    super.dispose();
    _loripsumBloc.dispose();
  }
}
