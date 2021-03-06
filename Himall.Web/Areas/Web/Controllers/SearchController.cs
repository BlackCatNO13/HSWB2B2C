using Himall.IServices;
using Himall.IServices.QueryModel;
using Himall.Model;
using Himall.Web.Areas.SellerAdmin.Models;
using Himall.Web.Areas.Web;
using Himall.Web.Areas.Web.Models;
using Himall.Web.Framework;
using Microsoft.CSharp.RuntimeBinder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.CompilerServices;
using System.Web.Mvc;

namespace Himall.Web.Areas.Web.Controllers
{
	public class SearchController : BaseWebController
	{
		public SearchController()
		{
		}

		private void InitialCategory(List<CategoryJsonModel> model, long f_cateId, long sub_cateId)
		{
			string name = ServiceHelper.Create<ICategoryService>().GetCategory(f_cateId).Name;
			string str = ServiceHelper.Create<ICategoryService>().GetCategory(sub_cateId).Name;
			if (model.Any((CategoryJsonModel c) => c.Id == f_cateId.ToString()))
			{
				List<SecondLevelCategory> subCategory = model.FirstOrDefault((CategoryJsonModel c) => c.Id == f_cateId.ToString()).SubCategory;
				SecondLevelCategory secondLevelCategory = new SecondLevelCategory()
				{
					Name = str,
					Id = sub_cateId.ToString()
				};
				subCategory.Add(secondLevelCategory);
				return;
			}
			CategoryJsonModel categoryJsonModel = new CategoryJsonModel()
			{
				Name = name,
				Id = f_cateId.ToString()
			};
			List<SecondLevelCategory> secondLevelCategories = new List<SecondLevelCategory>();
			SecondLevelCategory secondLevelCategory1 = new SecondLevelCategory()
			{
				Id = sub_cateId.ToString(),
				Name = str
			};
			secondLevelCategories.Add(secondLevelCategory1);
			categoryJsonModel.SubCategory = secondLevelCategories;
			model.Add(categoryJsonModel);
		}

		[ActionName("Index")]
		public ActionResult Search(string keywords = "", string exp_keywords = "", long cid = 0L, long b_id = 0L, string a_id = "", int orderKey = 1, int orderType = 1, int pageNo = 1, int pageSize = 60)
		{
			int i;
			long valueId;
			long num;
			string str;
			ProductSearch productSearch = new ProductSearch()
			{
				shopId = 0,
				BrandId = b_id,
				CategoryId = cid,
				Ex_Keyword = exp_keywords,
				Keyword = keywords,
				OrderKey = orderKey,
				OrderType = orderType == 1,
				AttrIds = new List<string>(),
				PageNumber = pageNo,
				PageSize = pageSize
			};
			ProductSearch productSearch1 = productSearch;
			string str1 = a_id.Replace("%40", "@");
			char[] chrArray = new char[] { '@' };
			string[] strArrays = str1.Split(chrArray);
			for (i = 0; i < strArrays.Length; i++)
			{
				string str2 = strArrays[i];
				if (!string.IsNullOrWhiteSpace(str2))
				{
					productSearch1.AttrIds.Add(str2);
				}
			}
			IProductService productService = ServiceHelper.Create<IProductService>();
			PageModel<ProductInfo> pageModel = productService.SearchProduct(productSearch1);
			int total = pageModel.Total;
			ProductInfo[] array = pageModel.Models.ToArray();
			dynamic viewBag = base.ViewBag;
			num = (base.CurrentUser == null ? 0 : base.CurrentUser.Id);
			viewBag.BrowsedHistory = BrowseHistrory.GetBrowsingProducts(13, num);
			CategoryInfo category = ServiceHelper.Create<ICategoryService>().GetCategory(productSearch1.CategoryId);
			string str3 = (category == null ? string.Empty : category.Name);
			BrandInfo brand = ServiceHelper.Create<IBrandService>().GetBrand(b_id) ?? new BrandInfo();
			string str4 = (brand == null ? "" : brand.Name);
			string str5 = (string.IsNullOrEmpty(keywords) ? str3 : keywords);
			base.ViewBag.keywords = (string.IsNullOrEmpty(str5) ? str4 : str5);
			ViewBag.exp_keywords = exp_keywords;
			if (pageModel.Total == 0)
			{
				return View();
			}
			var categoryId = 
				from prod in array
                orderby prod.CategoryId
				group prod by prod.CategoryId into G
				select new { Key = G.Key, Path = G.FirstOrDefault().CategoryPath };
			List<CategoryJsonModel> categoryJsonModels = new List<CategoryJsonModel>();
			foreach (var variable in categoryId)
			{
				string path = variable.Path;
				char[] chrArray1 = new char[] { '|' };
				if (path.Split(chrArray1).Length != 2)
				{
					string path1 = variable.Path;
					chrArray = new char[] { '|' };
					if (path1.Split(chrArray).Length != 3)
					{
						continue;
					}
					string path2 = variable.Path;
					chrArray = new char[] { '|' };
					long num1 = long.Parse(path2.Split(chrArray)[1]);
					string path3 = variable.Path;
					chrArray = new char[] { '|' };
                    InitialCategory(categoryJsonModels, num1, long.Parse(path3.Split(chrArray)[2]));
				}
				else
				{
					string path4 = variable.Path;
					chrArray = new char[] { '|' };
					long num2 = long.Parse(path4.Split(chrArray)[0]);
					string path5 = variable.Path;
					chrArray = new char[] { '|' };
                    InitialCategory(categoryJsonModels, num2, long.Parse(path5.Split(chrArray)[1]));
				}
			}
			List<BrandInfo> brandInfos = new List<BrandInfo>();
			IEnumerable<long> nums = (
				from a in array
                where a.BrandId != 0
                select a.BrandId).Distinct<long>();
			IQueryable<BrandInfo> brands = 
				from a in ServiceHelper.Create<IBrandService>().GetBrands("")
				where nums.Contains(a.Id)
				select a;
			brandInfos = brands.ToList();
			List<TypeAttributesModel> typeAttributesModels = new List<TypeAttributesModel>();
			var collection = 
				from p in array
                group p by p.CategoryId into G
				select new { Key = G.Key, Count = G.Count() } into pp
				orderby pp.Count descending
				select pp;
			long key = collection.ToList()[0].Key;
			array = (
				from p in array
				orderby p.CategoryId.Equals(key) descending
				select p).ToArray();
			if (collection.Count() <= 20)
			{
				IEnumerable<ProductInfo> productInfos = 
					from p in array
                    where p.CategoryId.Equals(key)
					select p;
				foreach (ProductInfo productInfo in productInfos)
				{
					ProductAttributeInfo[] productAttributeInfoArray = productService.GetProductAttribute(productInfo.Id).ToArray();
					ProductAttributeInfo[] productAttributeInfoArray1 = productAttributeInfoArray;
					for (i = 0; i < productAttributeInfoArray1.Length; i++)
					{
						ProductAttributeInfo productAttributeInfo = productAttributeInfoArray1[i];
						if (typeAttributesModels.Any((TypeAttributesModel p) => p.AttrId == productAttributeInfo.AttributeId))
						{
							TypeAttributesModel typeAttributesModel = typeAttributesModels.FirstOrDefault((TypeAttributesModel p) => p.AttrId == productAttributeInfo.AttributeId);
							if (!typeAttributesModel.AttrValues.Any((TypeAttrValue p) => p.Id == productAttributeInfo.ValueId.ToString()))
							{
								if (productAttributeInfo.AttributesInfo.AttributeValueInfo.FirstOrDefault((AttributeValueInfo a) => a.Id == productAttributeInfo.ValueId) != null)
								{
									List<TypeAttrValue> attrValues = typeAttributesModel.AttrValues;
									TypeAttrValue typeAttrValue = new TypeAttrValue();
									valueId = productAttributeInfo.ValueId;
									typeAttrValue.Id = valueId.ToString();
									typeAttrValue.Name = productAttributeInfo.AttributesInfo.AttributeValueInfo.FirstOrDefault((AttributeValueInfo a) => a.Id == productAttributeInfo.ValueId).Value;
									attrValues.Add(typeAttrValue);
								}
							}
						}
						else
						{
							TypeAttributesModel typeAttributesModel1 = new TypeAttributesModel()
							{
								AttrId = productAttributeInfo.AttributeId,
								AttrValues = new List<TypeAttrValue>(),
								Name = productAttributeInfo.AttributesInfo.Name
							};
							TypeAttributesModel typeAttributesModel2 = typeAttributesModel1;
							foreach (AttributeValueInfo attributeValueInfo in productAttributeInfo.AttributesInfo.AttributeValueInfo)
							{
								if (!((IEnumerable<ProductAttributeInfo>)productAttributeInfoArray).Any((ProductAttributeInfo p) => p.ValueId == attributeValueInfo.Id))
								{
									continue;
								}
								List<TypeAttrValue> typeAttrValues = typeAttributesModel2.AttrValues;
								TypeAttrValue value = new TypeAttrValue();
								valueId = attributeValueInfo.Id;
								value.Id = valueId.ToString();
								value.Name = attributeValueInfo.Value;
								typeAttrValues.Add(value);
							}
							typeAttributesModels.Add(typeAttributesModel2);
						}
					}
				}
			}
			Dictionary<string, string> strs = new Dictionary<string, string>();
			foreach (string attrId in productSearch1.AttrIds)
			{
				long num3 = 0;
				chrArray = new char[] { '\u005F' };
				long.TryParse(attrId.Split(chrArray)[0], out num3);
				long num4 = 0;
				chrArray = new char[] { '\u005F' };
				long.TryParse(attrId.Split(chrArray)[1], out num4);
				AttributeInfo attributeInfo = ServiceHelper.Create<IProductService>().GetAttributeInfo(num3);
				AttributeValueInfo attributeValueInfo1 = attributeInfo.AttributeValueInfo.FirstOrDefault((AttributeValueInfo v) => v.Id == num4);
				string str6 = string.Concat(attributeInfo.Name, ':', attributeValueInfo1.Value);
				string str7 = "";
				foreach (string attrId1 in productSearch1.AttrIds)
				{
					if (attrId1.Equals(attrId))
					{
						if (productSearch1.AttrIds.Count() != 1)
						{
							continue;
						}
						str7 = attrId1;
					}
					else
					{
						str7 = string.Concat(str7, attrId1, '@');
					}
				}
				chrArray = new char[] { '@' };
				strs.Add(str6, str7.TrimEnd(chrArray));
			}
			ViewBag.Attrs = typeAttributesModels;
			ViewBag.Brands = brandInfos;
			ViewBag.Category = categoryJsonModels;
			ViewBag.cid = cid;
			ViewBag.b_id = b_id;
			ViewBag.a_id = a_id;
			ViewBag.orderKey = orderKey;
			ViewBag.orderType = orderType;
			dynamic obj = base.ViewBag;
			str = (b_id == 0 ? "" : brandInfos.FirstOrDefault((BrandInfo b) => b.Id.Equals(b_id)).Name);
			obj.BrandName = str;
			ViewBag.AttrDic = strs;
			base.ViewBag.Logined = (base.CurrentUser != null ? 1 : 0);
			switch (orderKey)
			{
				case 2:
				{
					ProductInfo[] productInfoArray = array;
					for (i = 0; i < productInfoArray.Length; i++)
					{
						ProductInfo productInfo1 = productInfoArray[i];
						ProductVistiInfo productVistiInfo = productInfo1.Himall_ProductVistis.FirstOrDefault();
						productInfo1.OrderCounts = (productVistiInfo == null || !productVistiInfo.OrderCounts.HasValue ? 0 : productVistiInfo.OrderCounts.Value);
					}
					array = (
						from p in array
                        orderby p.OrderCounts descending
						select p).ToArray();
					break;
				}
				case 3:
				{
					if (orderType != 2)
					{
						array = (
							from p in array
                            orderby p.MinSalePrice
							select p).ToArray();
						break;
					}
					else
					{
						array = (
							from p in array
                            orderby p.MinSalePrice descending
							select p).ToArray();
						break;
					}
				}
				case 4:
				{
					array = (
						from p in array
                        orderby p.ProductConsultationInfo.Count() descending
						select p).ToArray();
					break;
				}
				case 5:
				{
					array = (
						from p in array
                        orderby p.AddedDate descending
						select p).ToArray();
					break;
				}
			}
			PagingInfo pagingInfo = new PagingInfo()
			{
				CurrentPage = productSearch1.PageNumber,
				ItemsPerPage = pageSize,
				TotalItems = total
			};
			ViewBag.pageInfo = pagingInfo;
			CategoryInfo categoryInfo = ServiceHelper.Create<ICategoryService>().GetCategory(cid);
			if (categoryInfo != null && categoryInfo.Depth == 3)
			{
				array = (
					from p in array
                    where p.CategoryId == cid
					select p).ToArray();
			}
			return View(array ?? new ProductInfo[0]);
		}
	}
}