<?xml version="1.0" encoding="shift_jis"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="/">
<HTML>
	<HEAD>
		<B>�y�������y�ђn�Ւ����Ǘ��iGRNDTST.XML�j</B>
		<hr/>
		<TITLE>�y�������y�ђn�Ւ����Ǘ��iGRNDTST.XML�j</TITLE>
		<STYLE type="text/css">
			td {font-size: 10pt;}
			th {font-size: 10pt; background-color: LightCyan}
			.subtitle {background-color: RoyalBlue; font-weight: bold; color: white}
			.subsubtitle {background-color: PaleTurquoise; font-weight: bold; color: black}
			.subsubsubtitle {background-color: LightCyan; font-weight: bold; color: black}
		</STYLE>
	</HEAD>
	<BODY>
		<xsl:apply-templates/>
	</BODY>
</HTML>
<P/>

</xsl:template>

<xsl:template match="��b���">

	<table border="1" cellspacing="0" cellpadding="4">
	<FONT size="+1">
		<xsl:for-each select="../��b���">
			<tr>
			<td colspan="1" rowspan="1" class="subtitle"><xsl:value-of select="name()"/></td>
				<td class="subsubsubtitle">�K�p�v�̊</td>
				<xsl:variable name="elm-cnt" select="count(�K�p�v�̊)"/>
				<xsl:if test="$elm-cnt=0"><td><xsl:call-template name="elm-empty"/></td></xsl:if>
				<xsl:if test="$elm-cnt!=0">
					<xsl:for-each select="�K�p�v�̊">
					<td><xsl:call-template name="textdata"/></td>
					</xsl:for-each>
				</xsl:if>
			</tr>
		</xsl:for-each>

		<xsl:for-each select="../�R�����g">
			<xsl:variable name="cnt0" select="count(../�R�����g)"/>
			<xsl:if test="$cnt0=0"><td><xsl:call-template name="elm-empty"/></td></xsl:if>
			<xsl:if test="$cnt0!=0">
				<tr>
				<xsl:if test="position()=1">
					<td colspan="2" rowspan="{$cnt0}" class="subtitle"><xsl:value-of select="name()"/></td>
				</xsl:if>
				<td><xsl:value-of select="."/></td>
				</tr>
			</xsl:if>
		</xsl:for-each>

		<xsl:for-each select="../�\�t�g���[�J�pTAG">
			<xsl:variable name="cnt1" select="count(../�\�t�g���[�J�pTAG)"/>
			<xsl:if test="$cnt1=0"><td><xsl:call-template name="elm-empty"/></td></xsl:if>
			<xsl:if test="$cnt1!=0">
				<tr>
				<xsl:if test="position()=1">
					<td colspan="2" rowspan="{$cnt1}" class="subtitle"><xsl:value-of select="name()"/></td>
				</xsl:if>
				<td><xsl:value-of select="."/></td>
				</tr>
			</xsl:if>
		</xsl:for-each>


	</FONT>
	</table>
	<P/>

</xsl:template>

<xsl:template match="�R�����g"/>
<xsl:template match="�\�t�g���[�J�pTAG"/>

<xsl:template match="�������[1]">
	<table border="1" cellspacing="0" cellpadding="4">
	<font size="+1">

		<xsl:call-template name="createheader"/>

		<xsl:for-each select="../�������">
			<xsl:if test="position()=1"><xsl:call-template name="main"/></xsl:if>
			<xsl:if test="position()!=1"><tr><xsl:call-template name="main"/></tr></xsl:if>
		</xsl:for-each>
	</font>
	</table>
</xsl:template>

<xsl:template match="�������[position()!=1]"/>

<xsl:template name="createheader">
	<td colspan="30" class="subtitle"><xsl:value-of select="name()"/></td>
	<tr>
	<th colspan="1" rowspan="4" class="subsubtitle">�n�_��</th>
	<th colspan="1" rowspan="4" class="subsubtitle">�t�H���_��</th>
	<th colspan="1" rowspan="4" class="subsubtitle">�{�[�����O�����p�f�[�^�t�@�C����</th>
	<td colspan="9" class="subsubtitle">�ʒu���</td>
	<td colspan="18" rowspan="2" class="subsubtitle">�e�펎�����</td>
	</tr>
	<tr>
	<td colspan="3" class="subsubtitle">�o�x</td>
	<td colspan="3" class="subsubtitle">�ܓx</td>
	<td colspan="1" rowspan="3" class="subsubtitle">���n�n</td>
	<td colspan="1" rowspan="3" class="subsubtitle">�W��</td>
	<td colspan="1" rowspan="3" class="subsubtitle">�ʒu���R�����g</td>
	</tr>
	<tr>
	<th rowspan="2">�o�x_�x</th>
	<th rowspan="2">�o�x_��</th>
	<th rowspan="2">�o�x_�b</th>
	<th rowspan="2">�ܓx_�x</th>
	<th rowspan="2">�ܓx_��</th>
	<th rowspan="2">�ܓx_�b</th>
	<th rowspan="2">�d�q�f�[�^�V�[�g�t�@�C����</th>
	<th rowspan="2">�d�q�f�[�^�V�[�g�쐬�\�t�g�E�F�A��</th>
	<th rowspan="2">�f�[�^�V�[�g�����p�f�[�^�t�@�C����</th>
	<th rowspan="2">�f�[�^�V�[�g�����p�f�[�^�쐬�\�t�g�E�F�A��</th>
	<th rowspan="2">�����R�[�h</th>
	<th rowspan="2">�K�i�ԍ�</th>
	<th rowspan="2">��ԍ�</th>
	<th rowspan="2">��������</th>
	<th rowspan="2">�����ԍ�</th>
	<th rowspan="2">�����̎���</th>
	<th rowspan="2">������[�[�x</th>
	<th rowspan="2">�������[�[�x</th>
	<th rowspan="2">�����J�n�N����</th>
	<th rowspan="2">�����I���N����</th>
	<th rowspan="2">������</th>
	<th rowspan="2">�e�펎���R�����g</th>
	<th colspan="2">���������̎ʐ^���</th>
	</tr>
	<tr>
	<th>�f�W�^�����������̎ʐ^�t�@�C����</th>
	<th>�ʐ^���e</th>
	</tr>
</xsl:template>

<xsl:template name="main">
	<xsl:variable name="folderpathA" select="�t�H���_��"/>
	<xsl:variable name="shiryokyoshiinfocnt_gene" select="count(�e�펎�����)"/>
	
	<xsl:if test="count(�n�_��)=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�n�_��)!=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�n�_��"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�t�H���_��)=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�t�H���_��)!=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�t�H���_��"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�{�[�����O�����p�f�[�^�t�@�C����)=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�{�[�����O�����p�f�[�^�t�@�C����)!=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}">
			<xsl:for-each select="�{�[�����O�����p�f�[�^�t�@�C����">
			<a>
				<xsl:attribute name="href">
				..\DATA\<xsl:value-of select="text()"/>
				</xsl:attribute>
				<xsl:value-of select="text()"/>
			</a>
			</xsl:for-each>
		</td>
	</xsl:if>
	<xsl:if test="count(�ʒu���)=0">
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
		<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�ʒu���)!=0">
		<xsl:for-each select="�ʒu���">
			<xsl:if test="count(�o�x)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>>
			</xsl:if>
			<xsl:if test="count(�o�x)!=0">
				<xsl:for-each select="�o�x">
					<xsl:if test="count(�o�x_�x)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(�o�x_�x)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�o�x_�x"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
					<xsl:if test="count(�o�x_��)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(�o�x_��)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�o�x_��"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
					<xsl:if test="count(�o�x_�b)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(�o�x_�b)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�o�x_�b"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="count(�ܓx)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>>
			</xsl:if>
			<xsl:if test="count(�ܓx)!=0">
				<xsl:for-each select="�ܓx">
					<xsl:if test="count(�ܓx_�x)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(�ܓx_�x)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�ܓx_�x"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
					<xsl:if test="count(�ܓx_��)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(�ܓx_��)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�ܓx_��"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
					<xsl:if test="count(�ܓx_�b)=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
					</xsl:if>
					<xsl:if test="count(�ܓx_�b)!=0">
						<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�ܓx_�b"><xsl:call-template name="textdata"/></xsl:for-each></td>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="count(���n�n)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(���n�n)!=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="���n�n"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(�W��)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(�W��)!=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�W��"><xsl:call-template name="textdata"/></xsl:for-each></td>
			</xsl:if>
			<xsl:if test="count(�ʒu���R�����g)=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:call-template name="elm-empty"/></td>
			</xsl:if>
			<xsl:if test="count(�ʒu���R�����g)!=0">
				<td rowspan="{$shiryokyoshiinfocnt_gene}"><xsl:for-each select="�ʒu���R�����g[1]">
					<xsl:for-each select="../�ʒu���R�����g">
						<xsl:if test="position()=1"><xsl:call-template name="textdata"/></xsl:if>
						<xsl:if test="position()!=1">,<xsl:call-template name="textdata"/></xsl:if>
					</xsl:for-each>
				</xsl:for-each></td>
			</xsl:if>
		</xsl:for-each>
	</xsl:if>
	
	<xsl:for-each select="�e�펎�����">
		<xsl:if test="position()=1">
			 <xsl:call-template name="kakushusikeninfo">
				<xsl:with-param name="folderpathA"><xsl:value-of select="$folderpathA"/></xsl:with-param>
			 </xsl:call-template>
		</xsl:if>
		<xsl:if test="position()!=1">
			<tr>
				<xsl:call-template name="kakushusikeninfo">
					<xsl:with-param name="folderpathA"><xsl:value-of select="$folderpathA"/></xsl:with-param>
				</xsl:call-template>
			</tr>
		</xsl:if>
	</xsl:for-each>

</xsl:template>

<xsl:template name="kakushusikeninfo">
	<xsl:param name="folderpathA"/>
	<xsl:variable name="shiryokyoshiinfocnt_each" select="count(���������̎ʐ^���)"/>

	<!--<xsl:for-each select="../�t�H���_��">
		<xsl:variable name="foldername"><xsl:value-of select="."/></xsl:variable>
		<td><xsl:for-each select="../�e�펎�����/�d�q�f�[�^�V�[�g�t�@�C����"><xsl:apply-templates/></xsl:for-each></td>
	</xsl:for-each>-->
	<xsl:if test="count(�d�q�f�[�^�V�[�g�t�@�C����)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�d�q�f�[�^�V�[�g�t�@�C����)!=0">
		<td>
			<xsl:for-each select="�d�q�f�[�^�V�[�g�t�@�C����">
				<a>
					<xsl:attribute name="href">
					.\<xsl:value-of select="$folderpathA" />
					\<xsl:value-of select="text()"/>
					</xsl:attribute>
					<xsl:value-of select="text()"/>
				</a>
			</xsl:for-each>
		</td>
	</xsl:if>
	<xsl:if test="count(�d�q�f�[�^�V�[�g�쐬�\�t�g�E�F�A��)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�d�q�f�[�^�V�[�g�쐬�\�t�g�E�F�A��)!=0">
		<td><xsl:for-each select="�d�q�f�[�^�V�[�g�쐬�\�t�g�E�F�A��"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�f�[�^�V�[�g�����p�f�[�^�t�@�C����)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�f�[�^�V�[�g�����p�f�[�^�t�@�C����)!=0">
		<td>
			<xsl:for-each select="�f�[�^�V�[�g�����p�f�[�^�t�@�C����">
				<a>
					<xsl:attribute name="href">
					.\<xsl:value-of select="$folderpathA" />
					\<xsl:value-of select="text()"/>
					</xsl:attribute>
					<xsl:call-template name="textdata"/>
				</a>
			</xsl:for-each>
		</td>
	</xsl:if>
	<xsl:if test="count(�f�[�^�V�[�g�����p�f�[�^�쐬�\�t�g�E�F�A��)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�f�[�^�V�[�g�����p�f�[�^�쐬�\�t�g�E�F�A��)!=0">
		<td><xsl:for-each select="�f�[�^�V�[�g�����p�f�[�^�쐬�\�t�g�E�F�A��"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�����R�[�h)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�����R�[�h)!=0">
		<td><xsl:for-each select="�����R�[�h"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�K�i�ԍ�)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�K�i�ԍ�)!=0">
		<td><xsl:for-each select="�K�i�ԍ�"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(��ԍ�)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(��ԍ�)!=0">
		<td><xsl:for-each select="��ԍ�"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(��������)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(��������)!=0">
		<td><xsl:for-each select="��������"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�����ԍ�)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�����ԍ�)!=0">
		<td><xsl:for-each select="�����ԍ�"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�����̎���)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�����̎���)!=0">
		<td><xsl:for-each select="�����̎���"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(������[�[�x)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(������[�[�x)!=0">
		<td><xsl:for-each select="������[�[�x"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�������[�[�x)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�������[�[�x)!=0">
		<td><xsl:for-each select="�������[�[�x"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�����J�n�N����)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�����J�n�N����)!=0">
		<td><xsl:for-each select="�����J�n�N����"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�����I���N����)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�����I���N����)!=0">
		<td><xsl:for-each select="�����I���N����"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(������)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(������)!=0">
		<td><xsl:for-each select="������"><xsl:call-template name="textdata"/></xsl:for-each></td>
	</xsl:if>
	<xsl:if test="count(�e�펎���R�����g)=0">
		<td><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(�e�펎���R�����g)!=0">
		<td><xsl:for-each select="�e�펎���R�����g[1]">
			<xsl:for-each select="../�e�펎���R�����g">
				<xsl:if test="position()=1"><xsl:call-template name="textdata"/></xsl:if>
				<xsl:if test="position()!=1">,<xsl:call-template name="textdata"/></xsl:if>
			</xsl:for-each>
			</xsl:for-each>
		</td>
	</xsl:if>
	<xsl:if test="count(���������̎ʐ^���)=0">
		<td colspan="2"><xsl:call-template name="elm-empty"/></td>
	</xsl:if>
	<xsl:if test="count(���������̎ʐ^���)!=0">
		<td colspan="2">
			<table cellpadding="1" cellspacing="0" border="1" style="text-align: left; width: 100%;">
				<xsl:for-each select="���������̎ʐ^���">
					<xsl:call-template name="shiryokyoshiinfo">
						<xsl:with-param name="folderpathA"><xsl:value-of select="$folderpathA"/></xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</table>
		</td>
	</xsl:if>

</xsl:template>


<xsl:template name="textdata">
	<xsl:variable name="char-cnt" select="string-length()"/>
	<xsl:if test="$char-cnt=0"><xsl:call-template name="elm-empty"/></xsl:if>
	<xsl:if test="$char-cnt!=0"><xsl:apply-templates/></xsl:if>
</xsl:template>

<xsl:template name="elm-empty">
	<xsl:text><!--��̃X�y�[�X��}�����܂��B-->�@</xsl:text>
</xsl:template>

<xsl:template name="shiryokyoshiinfo">
	<xsl:param name="folderpathA"/>
	
	<tr>
		<td>
			<xsl:if test="count(�f�W�^�����������̎ʐ^�t�@�C����)=0">
				<xsl:call-template name="elm-empty"/>
			</xsl:if>
			<xsl:if test="count(�f�W�^�����������̎ʐ^�t�@�C����)!=0">
				<xsl:for-each select="�f�W�^�����������̎ʐ^�t�@�C����">
					<a>
						<xsl:attribute name="href">
						.\<xsl:value-of select="$folderpathA" />
						\TESTPIC
						\<xsl:value-of select="text()"/>
						</xsl:attribute>
						<xsl:call-template name="textdata"/>
					</a>
				</xsl:for-each>
			</xsl:if>
		</td>
		<td>
			<xsl:if test="count(�ʐ^���e)=0">
				<xsl:call-template name="elm-empty"/>
			</xsl:if>
			<xsl:if test="count(�ʐ^���e)!=0">
				<xsl:for-each select="�ʐ^���e"><xsl:call-template name="textdata"/></xsl:for-each>
			</xsl:if>
		</td>
	</tr>
</xsl:template>


</xsl:stylesheet>