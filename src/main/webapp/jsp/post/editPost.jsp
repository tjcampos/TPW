<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dados do post</title>

<script type="text/javascript">
	$(document).ready(function() {

		$('#btnSalvar').qtip( {
			content : 'Salvar dados do post',
			style : {
				name : 'cream',
				padding : '7px 13px',
				width : {
					max : 210,
					min : 0
				},
				tip : true
			}
		});

		$('#menu2').css("background-color", "#4198f6");

	});
</script>

<script type="text/javascript" src="/tpw/js/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">

	tinyMCE.init({	
		mode : "textareas",
		theme : "advanced",

		// Theme options
		theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true
	});

	function toggleEditor(id) {
		if (!tinyMCE.get(id))
			tinyMCE.execCommand('mceAddControl', false, id);
		else
			tinyMCE.execCommand('mceRemoveControl', false, id);
	}

</script>

</head>

<body>
	
<center>
	<div class="divPadrao" style="width: 800px">

	<s:form theme="simple" action="post!updatePost" namespace="/jsp">

		<input type="hidden" name="post.id" value="${post.id}"></input>
		<table width="100%">
			<tr>
				<td colspan="4" align="center">
				<h3>Editar post</h3>
				</td>
			</tr>
	
			<tr>				
				<td colspan="4">
					<span class="label" style="font-weight: bold">Titulo</span> <br />
					<s:textfield name="post.titulo" maxlength="255"	cssStyle="width: 99%" />
				</td>
			</tr>
	
			<tr>
				<td colspan="4"><s:textarea name="post.texto" cssStyle="width: 100%; height: 500px" /></td>
			</tr>
			<tr>
				<td colspan="5">
				<div style="margin-top: 20px; text-align: right" class="sepDivUp">
				<s:submit id="btnSalvar" value="Salvar" /></div>
				</td>
			</tr>
		</table>

	</s:form>
	
</div>

</center>

</body>
</html>
