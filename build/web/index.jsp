<html>
<head>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<title>Dólar</title>
</head>
<body>
   <%@page import="org.w3c.dom.Node, org.w3c.dom.Element, org.w3c.dom.Document, 
           org.w3c.dom.NodeList, javax.xml.parsers.DocumentBuilder,
           javax.xml.parsers.DocumentBuilderFactory" %>
   
   <%    
    float cotacaoDolar;
    float real;
    float dolares;
    
    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    DocumentBuilder        builder = factory.newDocumentBuilder();
    Document doc = builder.parse("https://economia.awesomeapi.com.br/xml/last/BRL-USD");
    Element  root        = doc.getDocumentElement();
    NodeList xmlNodes = root.getChildNodes(); 
      
    Node valorAtual;
    NodeList valor;
    Node bid;
    String valorBid="";
    for (int i=0; i<xmlNodes.getLength(); i++)
    {
        valorAtual = xmlNodes.item(i);
        valor = valorAtual.getChildNodes();
        bid = valor.item(7);
        valorBid = bid.getFirstChild().getNodeValue();    
    }
    
    cotacaoDolar = Float.parseFloat(valorBid);
    String cotacaoFormatado = String.format("%.2f", cotacaoDolar);
    out.println("<br><div class='card border border-success w-25 p-3'>"
            + "<div class='card-body'><p>"
            + "<b>Cotação atual do real/dólar: $" + cotacaoFormatado + "</p>"
                + "</div></div>");
    real = Float.parseFloat(request.getParameter("real"));
    dolares = real*cotacaoDolar;
    String realFormatado = String.format("%.2f", real);
    String dolaresFormatado = String.format("%.2f", dolares); 
    out.println("<br><div class='card border border-success w-25 p-3'>"
            + "<div class='card-body'><h3>O Valor de R$"
            + realFormatado + " é o equivalente a $"
     + dolaresFormatado + " dólares.</h3>");
        %>
</body>
</html>