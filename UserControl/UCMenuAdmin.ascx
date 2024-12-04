﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCMenuAdmin.ascx.vb" Inherits="CFMISNew.UCMenuAdmin" %>
<link href="App_Themes/Theme1/main.css" rel="stylesheet" />
<asp:Menu ID="mFactsheet" runat="server" DataSourceID="smpdsrc" StaticDisplayLevels="4" CssClass="mainMenu" Height="400px" OnMenuItemDataBound="mFactsheet_MenuItemDataBound">
    <LevelMenuItemStyles>
        <asp:MenuItemStyle Font-Bold="True" Font-Size="18px" Font-Underline="False"  
            VerticalPadding="5px"/>
        <asp:MenuItemStyle Font-Bold="True" Font-Underline="False" 
            VerticalPadding="3px" Font-Size="16px" ForeColor="#00287D" />
        <asp:MenuItemStyle Font-Underline="False" HorizontalPadding="3px" Font-Size="14px" />
    </LevelMenuItemStyles>

</asp:Menu>
<asp:SiteMapDataSource ID="smpdsrc" runat="server" SiteMapProvider="SiteMap" />
<script lang="javascript" type="text/javascript">

    function GoTo(url) {
        window.open(url);
        //// Cancel the event bubbling. *This code is browser dependent.*
    }

</script>