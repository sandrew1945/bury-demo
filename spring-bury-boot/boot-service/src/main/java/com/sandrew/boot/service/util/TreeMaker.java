/**********************************************************************
* <pre>
* FILE : TreeMaker.java
* CLASS : TreeMaker
*
* AUTHOR : SuMMeR
*
* FUNCTION : TODO
*
*
*======================================================================
* CHANGE HISTORY LOG
*----------------------------------------------------------------------
* MOD. NO.| DATE | NAME | REASON | CHANGE REQ.
*----------------------------------------------------------------------
* 		  |2012-8-24| SuMMeR| Created |
* DESCRIPTION:
* </pre>
***********************************************************************/
/**
* $Id: TreeMaker.java,v 1.7 2014/01/22 03:10:51 zhangjiwei Exp $
*/

package com.sandrew.boot.service.util;


import com.sandrew.boot.bean.MenuBean;

import java.util.ArrayList;
import java.util.List;


/**
 * Function    : 
 * @author     : SuMMeR
 * CreateDate  : 2012-8-24
 * @version    :
 */
public class TreeMaker
{
	public static String buildTree(List<MenuBean> functions)
	{
		StringBuilder sB = new StringBuilder();
		List<TreeNode> menuList = handleNode(functions);
		sB.append(buildItem(new StringBuilder(), menuList));
		return sB.toString();
	}

	private static StringBuilder buildItem(StringBuilder sB, List<TreeNode> treeNodes)
	{
		/*
		 *   1.先判断是否子真正的节点（子节点的同时也不是根节点），如果是，当做子节点进行处理
		 *   2.在判断是否是根节点，如果是根节点，那么当做根节点处理，并且判断该根节点下面是否有子节点，如果没有，不添加ul标签
		 *   3.中间节点直接处理（既有父节点又有子节点）
		 * 
		 */
		for (TreeNode node : treeNodes)
		{
			if (node.isLeaf() && (null != node.getFatherNode()))
			{
				sB.append("<li><a class=\"ajaxify\" href=\"" + node.getUrl() + "\">");
				if (null != node.getImgUrl())
				{
					sB.append("<i class=\"" + node.getImgUrl() + "\">  </i>  ");
				}
				sB.append(node.getName() + "</a></li>");
			}
			else
			{
				if (null == node.getFatherNode())
				{
					// 顶层结点
					sB.append("<li>");
					if(!node.isLeaf())
					{
						sB.append("<a class=\"\" href=\"javascript:;\">");
					}
					else
					{
						sB.append("<a class=\"ajaxify\" href=\"" + node.getUrl() + "\">");
					}
					if (null != node.getImgUrl())
					{
						sB.append("<i class=\"" + node.getImgUrl() + "\"></i> ");
					}
					else
					{
						sB.append("<i class=\"fa fa-th-large\"></i> ");
					}
					sB.append("<span class=\"title\">" + node.getName() + "</span>");
					sB.append("<span class=\"arrow \"></span>");
					sB.append("</a>");
					if(!node.isLeaf())
					{
						sB.append("<ul class=\"sub-menu\">");
					}
				}
				else
				{
					// 中间结点
					sB.append("<li>");
					sB.append("<a href=\"javascript:;\">");
					sB.append("<i class=\"fa fa-folder-open-o\"></i> ");
					sB.append(node.getName());
					sB.append("<span class=\"arrow\"></span>");
					sB.append("</a>");
					sB.append("<ul class=\"sub-menu\">");
				}

			}
			if (node.hasChildren())
			{
				buildItem(sB, node.getChildren());
			}
			if (!node.isLeaf())
			{
				sB.append("</ul>");
				sB.append("</li>");
			}
		}
		return sB;
	}

	public static List<TreeNode> handleNode(List<MenuBean> functions)
	{
		List<TreeNode> menuList = new ArrayList<TreeNode>();
		TreeNode preNode = null;
		TreeNode curNode = null;
		for (int i = 0; i < functions.size(); i++)
		{
			MenuBean mb = functions.get(i);
			// 判断preNode是否为空
			if (preNode != null)
			{
				curNode = new TreeNode();
				curNode.setId(mb.getFuncId());
				curNode.setCode(mb.getFuncCode());
				curNode.setName(mb.getFuncName());
				curNode.setFatherId(mb.getParentId());
				curNode.setUrl(mb.getFunctionUrl());
				curNode.setImgUrl(mb.getImgUrl());
				//System.out.println("Code ================ " + curNode.getCode());
				// 先判断是否是相同的级别
				//if (preNode.getFatherId().equals(curNode.getFatherId()))
				if (preNode.getCode().length() == curNode.getCode().length())
				{
					// 同一个级别,
					if(null == preNode.getFatherNode())
					{
						// 判断preNode是否有父节点，如果没有，那么直接将该节点加到menuList中
						menuList.add(curNode);
					}
					else
					{
						// 判断preNode是否有父节点，如果有，那么将curNode也放入到preNode的父节点中
						preNode.getFatherNode().addChild(curNode);
						curNode.setFatherNode(preNode.getFatherNode());
					}
				}
				else
				{
					// 如果不是一个级别,那么判断curNode是否是preNode的子节点
					//if (curNode.getFatherId().equals(preNode.getCode()))
					if (curNode.getCode().length() > preNode.getCode().length())
					{
						// 如果是那么将curNode放入到preNode的子节点中
						preNode.addChild(curNode);
						curNode.setFatherNode(preNode);
					}
					else if ((curNode.getCode().length() < preNode.getCode().length()) && curNode.getCode().length() > 2)
					{
						// 如果不是,并且当前节点的代码长度大于2,说明是前一个节点的父节点的同级
						preNode.getFatherNode().getFatherNode().addChild(curNode);
						curNode.setFatherNode(preNode.getFatherNode().getFatherNode());
					}
					else
					{
						// 如果不是,那么将curNode放入到menuList中,说明是一个新的一级菜单
						menuList.add(curNode);
					}
				}
			}
			else
			{
				curNode = new TreeNode();
				curNode.setId(mb.getFuncId());
				curNode.setName(mb.getFuncName());
				curNode.setCode(mb.getFuncCode());
				curNode.setFatherId(mb.getParentId());
				curNode.setUrl(mb.getFunctionUrl());
				curNode.setImgUrl(mb.getImgUrl());
				menuList.add(curNode);
			}
			preNode = curNode;
		}
		return menuList;
	}
}
