﻿<%@ Page Title="Unassigned Submitted Questionnaire List" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UnassignedSubmittedQuestionnaireList.aspx.vb" Inherits="CFMISNew.UnassignedSubmittedQuestionnaireList" %>

<%@ Register Src="~/UserControl/UCMenuAdmin.ascx" TagPrefix="uc1" TagName="UCMenuAdmin" %>
<%@ Register Src="~/UserControl/UCMenuGeneral.ascx" TagPrefix="uc1" TagName="UCMenuGeneral" %>
<%@ Register Src="~/UserControl/UCMenuEnvEngineer.ascx" TagPrefix="uc1" TagName="UCMenuEnvEngineer" %>
<%@ Register Src="~/UserControl/UCMenuEnvDirector.ascx" TagPrefix="uc1" TagName="UCMenuEnvDirector" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="false"></asp:ScriptManager>
    <table width="98%">
        <tr>

<%--            <td style="vertical-align: top; width: 200px">
                <uc1:UCMenuAdmin runat="server" ID="UCMenuAdmin" />
                <uc1:UCMenuGeneral runat="server" ID="UCMenuGeneral" />
                <uc1:UCMenuEnvEngineer runat="server" ID="UCMenuEnvEngineer" />
                <uc1:UCMenuEnvDirector runat="server" ID="UCMenuEnvDirector" />
            </td>--%>

            <td valign="top" width="20%"> 
              <div style="padding-left:25px;  height:475px; background-color:#b3ccff;">
                 <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                            <uc1:UCMenuAdmin runat="server" id="UCMenuAdmin" />
                            <uc1:UCMenuGeneral runat="server" ID="UCMenuGeneral" />
                            <uc1:UCMenuEnvEngineer runat="server" id="UCMenuEnvEngineer" />
                            <uc1:UCMenuEnvDirector runat="server" id="UCMenuEnvDirector" />
                        </td>
                    </tr>
                 </table>
              </div>
            </td> 

            <td valign="top">
                <div style="padding-left: 10px;">
                    <br />
                    <div style="text-align: center">
                        <asp:Label ID="lblPendingHdg" runat="server" Text="List Of Unassigned Submitted Project(s):" Font-Size="14px" Font-Bold="True" Font-Underline="true "></asp:Label>
                    </div>
                     <div class="wideBox" style="width: 100%">
                    <br />
                    <br />
                    <asp:GridView ID="gvEnvironmentalUnassignedQuestionnaireSummary" runat="server" AutoGenerateColumns="False" DataKeyNames="project_pk" DataSourceID="sdsrcEnvironmentalUnassignedQuestionnaireSummary" AllowSorting="True" EmptyDataText="No match found"
                        ForeColor="#333333" GridLines="None" Width="98%" AllowPaging="True" OnDataBound="gvEnvironmentalUnassignedQuestionnaireSummary_DataBound" PageSize="20" CssClass="gvPadding">
                        <Columns>
                            <%--<asp:BoundField DataField="projectCode" HeaderText="projectCode" SortExpression="projectCode" />--%>
                            <asp:BoundField DataField="project_pk" HeaderText="project_pk" ReadOnly="True" SortExpression="project_pk" Visible="False" />
                            <asp:HyperLinkField DataNavigateUrlFields="project_pk" DataNavigateUrlFormatString="UnassignedSubmittedQuestionnaireForm.aspx?project_pk={0}" DataTextField="projectCode" HeaderText="Project #" ItemStyle-ForeColor="#0000CC" SortExpression="projectCode">
                                <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                                <ItemStyle Font-Bold="False" Font-Underline="True" ForeColor="Blue" Width="50px" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="projectDesc" HeaderText="Project Title" SortExpression="projectDesc">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Region" HeaderText="Region" ReadOnly="True" SortExpression="Region">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="stateName" HeaderText="State" SortExpression="stateName">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Project Manager" ReadOnly="True" SortExpression="Name">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="submitdate" HeaderText="PM Submitted Date" ReadOnly="True" SortExpression="submitdate" DataFormatString="{0:d}">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                        <PagerTemplate>
                            <asp:LinkButton ID="lbFirst" runat="server" CommandArgument="First" Enabled='<%#IIf((gvEnvironmentalUnassignedQuestionnaireSummary.PageIndex) < 1, "false", "true")%>'
                                CommandName="Page" ForeColor="Black">&lt;&lt; First</asp:LinkButton>
                            <asp:LinkButton ID="lbPrev" runat="server" CommandArgument="Prev" Enabled='<%#IIf((gvEnvironmentalUnassignedQuestionnaireSummary.PageIndex) < 1, "false", "true")%>'
                                CommandName="Page" ForeColor="Black">&lt; Prev</asp:LinkButton>
                            [Total Pg No: <%=gvEnvironmentalUnassignedQuestionnaireSummary.PageCount%>][Current pg: <%=gvEnvironmentalUnassignedQuestionnaireSummary.PageIndex + 1%>]
                    <asp:LinkButton ID="lbNext" runat="server" CommandArgument="Next" Enabled='<%#IIf((gvEnvironmentalUnassignedQuestionnaireSummary.PageCount) = (gvEnvironmentalUnassignedQuestionnaireSummary.PageIndex + 1), "false", "true")%>'
                        CommandName="Page" ForeColor="Black">Next &gt;</asp:LinkButton>
                            <asp:LinkButton ID="lbLast" runat="server" CommandArgument="Last" Enabled='<%#IIf((gvEnvironmentalUnassignedQuestionnaireSummary.PageCount) = (gvEnvironmentalUnassignedQuestionnaireSummary.PageIndex + 1), "false", "true")%>'
                                CommandName="Page" ForeColor="Black">Last &gt;&gt;</asp:LinkButton><br />
                            <asp:Label ID="lblGoTo" runat="server" Text="Go to Pg:"></asp:Label>
                            <asp:DropDownList ID="ddlPagingPending" runat="server" AutoPostBack="True"
                                Height="21px"
                                Width="45px" OnSelectedIndexChanged="ddlPagingPending_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:Label ID="lblCurrentPg" runat="server"></asp:Label>
                        </PagerTemplate>
                        <PagerStyle HorizontalAlign="Center" BackColor="#A3BBE0" ForeColor="Black" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="sdsrcEnvironmentalUnassignedQuestionnaireSummary" runat="server" ConnectionString="<%$ ConnectionStrings:MainConn %>"
                        SelectCommand="EnvironmentalUnassignedQuestionnaireSummary" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </div>
                    </div>
                <br />
                <br />
                <br />
                <br />
                <div style="padding-left: 10px">
                    <br />
                    <div style="text-align: center">
                        <asp:Label ID="lblNoquestionnaire" runat="server" Text="List Of Projects Without Questionnaire Submitted:" Font-Size="14px" Font-Underline="true" Font-Bold="True"></asp:Label>
                    </div>
                    <br />
                </div>
                <table style="width: 100%;">
                    <tr>
                        <td style="vertical-align: top; width: 200px">
                            <asp:Label ID="lblRole" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td valign="top" style="width: 100%">
                            <div class="wideBox" style="width: 100%">
                                <h3>Search for a Project</h3>
                                <asp:Panel ID="pnlSearchFields" runat="server" DefaultButton="btnSearch">
                                    <table>
                                        <tr>
                                            <td style="height: 32px; width: 75px;">
                                                <asp:Label ID="lblProjNum" runat="server" Text="Project #:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td style="height: 32px; width: 144px;">
                                                <asp:TextBox ID="txtProjectNum" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td style="height: 32px; width: 144px;">
                                                <cc1:TextBoxWatermarkExtender ID="tweProjNum" runat="server" TargetControlID="txtProjectNum" WatermarkCssClass="Watermark" WatermarkText="Enter full or partial No."></cc1:TextBoxWatermarkExtender>
                                            </td>
                                            <td class="auto-style1">
                                                <asp:Label ID="lblProjTitle" runat="server" Text="Project Title:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:TextBox ID="txtProjTitle" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style2">
                                                <cc1:TextBoxWatermarkExtender ID="tweProjTitle" runat="server" TargetControlID="txtProjTitle" WatermarkCssClass="Watermark" WatermarkText="Enter full or partial Title"></cc1:TextBoxWatermarkExtender>
                                            </td>
                                            <td class="auto-style1">
                                                <asp:Label ID="lblLocation" runat="server" Text="Location:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:TextBox ID="txtLocation" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style2">
                                                <cc1:TextBoxWatermarkExtender ID="tweProjLocation" runat="server" TargetControlID="txtLocation" WatermarkCssClass="Watermark" WatermarkText="Enter City or State"></cc1:TextBoxWatermarkExtender>
                                            </td>
                                            <td class="auto-style1">
                                                <asp:Label ID="lblManager" runat="server" Text="Manager: " Font-Bold="True"></asp:Label></td>
                                            <td class="auto-style2">
                                                <asp:DropDownList ID="ddlManager" runat="server" DataSourceID="sdsrcRoleManager"
                                                    DataTextField="FullName" DataValueField="FullName"
                                                    AppendDataBoundItems="True" Height="21px" Width="201px">
                                                    <asp:ListItem Text="-Select-" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                             <%-- <td class="auto-style1">
                                                <asp:Label ID="Label1" runat="server" Text="Location: " Font-Bold="True"></asp:Label></td>
                                            <td class="auto-style2">
                                                <asp:DropDownList ID="ddlLocation" runat="server" DataSourceID="sdsrcRoleManager"
                                                    DataTextField="FullName" DataValueField="FullName"
                                                    AppendDataBoundItems="True" Height="21px" Width="201px">
                                                    <asp:ListItem Text="-Select-" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>--%>
                                        </tr>
                                        <tr>

                                            <td class="auto-style2">
                                                <asp:SqlDataSource ID="sdsrcRoleManager" runat="server" ConnectionString="<%$ ConnectionStrings:MainConn %>"
                                                    SelectCommand="SELECT personnel_pk, fullName FROM Personnel
                                  WHERE (personnel_pk IN(SELECT DISTINCT personnel_fk FROM ProjectPersonnel WHERE (ManagerRole_fk = 2))  AND deleted=0)
                                  order by fullName"></asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table style="width: 250px;">
                                        <tr>
                                            <td style="align-items: center;">
                                                <asp:Button ID="btnSearch" runat="server" Text="Search" Font-Bold="True"
                                                    Width="99px" OnClick="btnSearch_Click" />
                                            </td>
                                            <td style="align-items: center;">
                                                <asp:Button ID="btnClear" runat="server" Font-Bold="True"
                                                    Text="Reset" Width="99px" OnClick="btnClear_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                                <asp:Label ID="lblSearchError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

                            </div>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="pnlShowGrid" runat="server" Visible="False">
                    <div class="wideBox" style="padding-left: 15px">
                        <%--   <h3>Search Results</h3>--%>
                        <table width="98%">
                            <tr>
                                <td align="left">Showing records <%=gvFctStSearch.PageIndex * gvFctStSearch.PageSize + 1%> -
                    <%=(gvFctStSearch.PageIndex * gvFctStSearch.PageSize + gvFctStSearch.Rows.Count)%>
                                    <asp:Label ID="lblTotalRec" runat="server"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblPageSize" runat="server" Text="Show records per page: "></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlPageSize" runat="server" AppendDataBoundItems="True"
                                        AutoPostBack="True" Height="21px"
                                        OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" Width="48px">
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>100</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>

                        <asp:GridView ID="gvFctStSearch" runat="server" AutoGenerateColumns="False"
                            Width="98%" OnDataBound="gvFctStSearch_DataBound" DataSourceID="odsrcSearchFctst"
                            AllowPaging="True" EmptyDataText="No match found"
                            AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="12px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="project_pk" HeaderText="project_pk" SortExpression="project_pk" Visible="False" />
                                <asp:HyperLinkField DataNavigateUrlFields="project_pk" DataNavigateUrlFormatString="UnassignedSubmittedQuestionnaireFormNoQuestionnaire.aspx?project_pk={0}" DataTextField="projectCode" HeaderText="Project #" ItemStyle-ForeColor="#0000CC" SortExpression="projectCode">
                                    <ItemStyle Font-Bold="False" Font-Underline="True" ForeColor="Blue" Wrap="False" />
                                </asp:HyperLinkField>
                                <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Font-Bold="False" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="region" HeaderText="Region" SortExpression="region">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="stationName" HeaderText="Station" SortExpression="station_name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Font-Bold="False" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="projectDesc" HeaderText="Description" SortExpression="project_desc">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Font-Bold="False" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <%-- <asp:BoundField DataField="statusName" HeaderText="Status" SortExpression="status">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle Font-Bold="False" HorizontalAlign="Left" />
                                            </asp:BoundField>--%>
                                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="category1" Visible="False">
                                    <ItemStyle Font-Bold="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SubCategoryName" HeaderText="Sub Category" SortExpression="category2" Visible="False">
                                    <ItemStyle Font-Bold="False" />
                                </asp:BoundField>
                                <%-- <asp:BoundField DataField="projectTypeName" HeaderText="Type" SortExpression="project_type">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle Font-Bold="False" HorizontalAlign="Left" />
                                            </asp:BoundField>--%>
                                <%-- <asp:CheckBoxField DataField="subProjectFlag" HeaderText="Sub Project" SortExpression="sub_project_flag">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle Font-Bold="False" HorizontalAlign="Center" />
                                            </asp:CheckBoxField>--%>
                                <asp:BoundField DataField="fms_number" HeaderText="FMS #" SortExpression="current_fms_number" Visible="False">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Font-Bold="False" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="PM" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPm" runat="server" Text='<%# IIf(Eval("Name").ToString() = "", "No PM selected", Eval("Name")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>

                                <%-- <asp:TemplateField HeaderText="Factsheet Review">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hlFSReview" runat="server" Text="Open Review" Visible='<%# IIf(Eval("subProjectFlag")="True" OR Eval("Status")="Inactive" , "False", "True") %>'
                                                        NavigateUrl='<%# "FSDetails.aspx?project_pk="+Eval("project_pk").ToString() %>'></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                            </Columns>
                            <PagerTemplate>
                                <asp:LinkButton ID="lbFirst" runat="server" CommandArgument="First" Enabled='<%#IIf((gvFctStSearch.PageIndex) < 1, "false", "true")%>'
                                    CommandName="Page" ForeColor="White">&lt;&lt; First</asp:LinkButton>
                                <asp:LinkButton ID="lbPrev" runat="server" CommandArgument="Prev" Enabled='<%#IIf((gvFctStSearch.PageIndex) < 1, "false", "true")%>'
                                    CommandName="Page" ForeColor="White">&lt; Prev</asp:LinkButton>
                                [Total Pg No: <%=gvFctStSearch.PageCount%>][Current pg: <%=gvFctStSearch.PageIndex + 1%>]
                    <asp:LinkButton ID="lbNext" runat="server" CommandArgument="Next" Enabled='<%#IIf((gvFctStSearch.PageCount) = (gvFctStSearch.PageIndex + 1), "false", "true")%>'
                        CommandName="Page" ForeColor="White">Next &gt;</asp:LinkButton>
                                <asp:LinkButton ID="lbLast" runat="server" CommandArgument="Last" Enabled='<%#IIf((gvFctStSearch.PageCount) = (gvFctStSearch.PageIndex + 1), "false", "true")%>'
                                    CommandName="Page" ForeColor="White">Last &gt;&gt;</asp:LinkButton><br />
                                <asp:Label ID="lblGoTo" runat="server" Text="Go to Pg:"></asp:Label>
                                <asp:DropDownList ID="ddlPaging" runat="server" AutoPostBack="True"
                                    Height="21px" OnSelectedIndexChanged="ddlPaging_SelectedIndexChanged"
                                    Width="45px">
                                </asp:DropDownList>
                                <asp:Label ID="lblCurrentPg" runat="server"></asp:Label>
                            </PagerTemplate>
                            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
<%--                        <asp:ObjectDataSource ID="odsrcSearchFctst" runat="server"
                            OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetSearchProjectInfoEnvironmental"
                            TypeName="FactSheetApp.FactSheetNewTableAdapters.SearchProjectInfoTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtProjectNum" Name="projectCode" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtProjTitle" Name="ProjectTitle" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtLocation" Name="Location" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="ddlManager" Name="Name" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>--%>
                        <asp:ObjectDataSource ID="odsrcSearchFctst" runat="server"
                            OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetSearchProjectInfoEnvironmental"
                            TypeName="CFMISNew.FactSheetDataSetTableAdapters.SearchProjectInfoEnvironmentalTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtProjectNum" Name="projectCode" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtProjTitle" Name="ProjectTitle" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtLocation" Name="Location" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="ddlManager" Name="Name" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>

                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>




