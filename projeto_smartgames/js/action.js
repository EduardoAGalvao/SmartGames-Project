const $ = (el) => document.querySelector(el);

const atualizarMapa = (codigoJogo, codigoLoja) => {

	const quantidadeDeJogos = 6;

	for(let i = 1; i<=quantidadeDeJogos; i++){

		if(codigoJogo == i){

			switch (codigoLoja){
		
				case "1":
					$(`#iframe_google${i}`).src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d116975.0147469557!2d-46.76887304179687!3d-23.623361799999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce50c38c0cba61%3A0xf636e54dd93f091e!2sMorumbi+Shopping!5e0!3m2!1spt-BR!2sbr!4v1557057658596!5m2!1spt-BR!2sbr";
				break;

				case "2":
					$(`#iframe_google${i}`).src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3656.884877710184!2d-46.69788488547981!3d-23.572577784677314!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce570972e4f21b%3A0xf281469aadff5d66!2sDengo+Chocolates!5e0!3m2!1spt-BR!2sbr!4v1556976844778!5m2!1spt-BR!2sbr";
				break;

				case "3":
					$(`#iframe_google${i}`).src= "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3653.9845532475492!2d-46.67891538547745!3d-23.676510384625814!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce501ac3b77f8f%3A0xdaa230261180506a!2sShopping+Interlagos!5e0!3m2!1spt-BR!2sbr!4v1557057869460!5m2!1spt-BR!2sbr";
				break;

				case "4":
					$(`#iframe_google${i}`).src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3656.6851876488367!2d-46.59655388547962!3d-23.579747484673714!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce5bf860fba1bb%3A0x56fa37f608c8ae04!2sR.+Cap.+Pacheco+e+Chaves%2C+313+-+Mooca%2C+S%C3%A3o+Paulo+-+SP%2C+03126-000!5e0!3m2!1spt-BR!2sbr!4v1557057377261!5m2!1spt-BR!2sbr";
				break;

				case "5":
					$(`#iframe_google${i}`).src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3659.380004355659!2d-46.6470182854819!3d-23.48281838472193!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94cef7a4895580cd%3A0xd9906786ed47a7e2!2sSantana+Parque+Shopping!5e0!3m2!1spt-BR!2sbr!4v1557058086540!5m2!1spt-BR!2sbr";
				break;

				case "6":
					$(`#iframe_google${i}`).src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3658.469517309728!2d-46.62023388548101!3d-23.515609584705555!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce5896c36da653%3A0x27553b50f02fec1f!2sShopping+Center+Norte!5e0!3m2!1spt-BR!2sbr!4v1557057570793!5m2!1spt-BR!2sbr";
				break;
			}
		}
	}
}

const identificarLoja = e => {
	const[loja, jogo] = e.target.id.split("-");
	const codigoJogo = jogo.replace(/[a-z]+/,"");
	const codigoLoja = loja.replace(/[a-z]+/,"");

	atualizarMapa(codigoJogo, codigoLoja);
}

document.querySelectorAll('.lojas').forEach(($loja) => $loja.addEventListener('click', identificarLoja));

